import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:one_day_one_something/app/data/model/enum/friends_request_code.dart';

import '../../data/firebase/firebase_const.dart';
import '../../data/model/firebase/friend_model.dart';

class FriendsService with StorageUtil {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 모든 친구 확인
  Future<List<FriendModel>> readFriends({FriendsRequestCode? code}) async {
    String? currentUserId = firebaseAuth.currentUser?.uid;

    if (currentUserId == null) {
      throw Exception("User is not logged in");
    }

    QuerySnapshot friendsSnapshot;
    if (code == null) {
      // 코드가 null이면 전체 데이터 가져오기
      friendsSnapshot = await _db
          .collection('users')
          .doc(currentUserId)
          .collection('friendslist')
          .get();
    } else {
      // 코드가 null이 아니면 해당 코드로 필터링
      friendsSnapshot = await _db
          .collection('users')
          .doc(currentUserId)
          .collection('friendslist')
          .where('code', isEqualTo: code.index)
          .get();
    }

    return friendsSnapshot.docs
        .map((doc) => FriendModel.fromJson({
              'uid': doc.id,
              'code': doc['state'],
            }))
        .toList();
  }

  // 친구 요청 보내기
  Future<void> sendFriendRequest({required String friendsUid}) async {
    try {
      String? currentUserId = firebaseAuth.currentUser?.uid;

      if (currentUserId == null) {
        throw Exception("User is not logged in");
      }

      await _db.runTransaction((transaction) async {
        // 친구 요청을 보낸 사용자의 friendslist
        DocumentReference senderRef = _db
            .collection('users')
            .doc(currentUserId)
            .collection('friendslist')
            .doc(friendsUid);

        // 친구 요청을 받는 사용자의 friendslist
        DocumentReference recipientRef = _db
            .collection('users')
            .doc(friendsUid)
            .collection('friendslist')
            .doc(currentUserId);

        //Transaction 잘 될거라 가정하고 sender로만 데이터가 있는지 없는지 체크
        DocumentSnapshot senderSnapshot = await transaction.get(senderRef);
        if (!senderSnapshot.exists ) {
          // 만약 데이터가 존재하지 않으면 바로 요청 가능
          transaction.set(
              senderRef, {'state': FriendsRequestCode.SENT.index, 'denied': 0});
          transaction.set(recipientRef,
              {'state': FriendsRequestCode.RECEIVED.index, 'denied': 0});
        } else if ((senderSnapshot['state'] ?? -1) == FriendsRequestCode.IDLE.index &&
            (senderSnapshot['denied'] ?? 3) < 2) {
          // 또는 거절 횟수가 2회 미만인 경우 요청 가능
          transaction.set(
              senderRef, {'state': FriendsRequestCode.SENT.index, 'denied': senderSnapshot['denied']});
          transaction.set(recipientRef,
              {'state': FriendsRequestCode.RECEIVED.index, 'denied': senderSnapshot['denied']});
        }
      });
    } catch (e) {
      log("Failed to send friend request: $e");
      rethrow;
    }
  }

  // 친구 요청에 대한 응답 : 수락 또는 거절
  Future<void> responseFriendRequest(
      {required String friendsUid, required bool isAccepted}) async {
    try {
      String? currentUserId = firebaseAuth.currentUser?.uid;

      if (currentUserId == null) {
        throw Exception("User is not logged in");
      }

      await _db.runTransaction((transaction) async {
        DocumentReference senderRef = _db
            .collection('users')
            .doc(currentUserId)
            .collection('friendslist')
            .doc(friendsUid);

        DocumentReference recipientRef = _db
            .collection('users')
            .doc(friendsUid)
            .collection('friendslist')
            .doc(currentUserId);

        if (isAccepted) {
          // 친구 요청 승인 시, ACCEPT로 상태 변경
          transaction
              .update(senderRef, {'state': FriendsRequestCode.ACCEPT.index});
          transaction
              .update(recipientRef, {'state': FriendsRequestCode.ACCEPT.index});
        } else {
          //Transaction 잘 될거라 가정하고 sender로만 데이터가 있는지 없는지 체크
          DocumentSnapshot senderSnapshot = await transaction.get(senderRef);

          // 친구 요청 거절 시, IDLE 상태로 변경하고, denied + 1
          transaction.set(senderRef, {
            'state': FriendsRequestCode.IDLE.index,
            'denied': senderSnapshot['denied'] + 1
          });
          transaction.set(recipientRef, {
            'state': FriendsRequestCode.IDLE.index,
            'denied': senderSnapshot['denied'] + 1
          });
        }
      });
    } catch (e) {
      log("Failed to respond friend request: $e");
      rethrow;
    }
  }

  // 친구 삭제
  Future<void> deleteFriend() async {}
}
