import 'package:one_day_one_something/app/data/model/firebase/goal_model.dart';
import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? uid;
  String nickname;
  String name;
  String email;
  String? imageUrl;
  List<GoalModel>? goalList;
  List<String>? friendUidList;
  List<TrackModel>? friendTrackList;

  UserModel({
    this.uid,
    required this.nickname,
    required this.name,
    required this.email,
    this.imageUrl,
    this.goalList,
    this.friendUidList,
    this.friendTrackList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
