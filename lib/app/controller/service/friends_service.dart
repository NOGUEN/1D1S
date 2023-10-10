import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/data/local/db/storage_util.dart';
import 'package:one_day_one_something/app/data/model/enum/friends_request_code.dart';

import '../../data/model/firebase/friend_model.dart';

class FriendsService with StorageUtil{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 모든 친구 확인
  Future<List<FriendModel>> readFriends(FriendsRequestCode? code) async {
    String? currentUserId = _auth.currentUser?.uid;

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
        .map((doc) =>
        FriendModel.fromJson({
          'uid': doc.id,
          'code': doc['state'],
        }))
        .toList();
  }

  // 친구 요청 보내기
  Future<void> sendFriendRequest({required String friendsUid}) async {
    try {
      String? currentUserId = _auth.currentUser?.uid;

      if (currentUserId == null) {
        throw Exception("User is not logged in");
      }

      await _db.runTransaction((transaction) async {
        // 보낸 사용자의 friendslist 업데이트
        DocumentReference senderRef = _db
            .collection('users')
            .doc(currentUserId)
            .collection('friendslist')
            .doc(friendsUid);

        transaction.set(senderRef, {'state': FriendsRequestCode.SENT.index});

        // 받는 사용자의 friendslist 업데이트
        DocumentReference recipientRef = _db
            .collection('users')
            .doc(friendsUid)
            .collection('friendslist')
            .doc(currentUserId);

        transaction.set(
            recipientRef, {'state': FriendsRequestCode.RECEIVED.index});
      });
    } catch (e) {
      log("Failed to send friend request: $e");
      rethrow;
    }
  }

  // 친구 요청에 대한 응답 : 수락 또는 거절
  Future<void> responseFriendRequest() async {}

  // 친구 삭제
  Future<void> deleteFriend() async {}
}
