import 'package:one_day_one_something/app/data/model/firebase/goal_model.dart';
import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? uid;
  String nickname;
  // String name;
  String email;
  String? imageUrl;
  List<GoalModel>? goalList;
  List<String>? friendUidList;
  List<TrackModel>? friendTrackList;

  UserModel({
    this.uid,
    required this.nickname,
    // required this.name,
    required this.email,
    this.imageUrl,
    this.goalList,
    this.friendUidList,
    this.friendTrackList,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     _$UserModelFromJson(json);

  // Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
        uid: data?['uid'],
        nickname: data?['nickname'],
        // name: data?['name'],
        email: data?['email']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      "nickname": nickname,
      // "name": name,
      "email": email,
      if (imageUrl != null) "imageUrl": imageUrl,
      if (goalList != null) "goalList": goalList,
      if (friendUidList != null) "friendUidList": friendUidList,
      if (friendTrackList != null) "friendTrackList": friendTrackList,
    };
  }
}
