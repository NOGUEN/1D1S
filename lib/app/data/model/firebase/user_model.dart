import 'package:one_day_one_something/app/data/model/firebase/goal_model.dart';
import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';

class UserModel {
  String uid;
  String nickname;
  String name;
  String email;
  String? imageUrl;
  List<GoalModel>? goalList;
  List<String>? friendUidList;
  List<TrackModel>? friendTrackList;

  UserModel({
    required this.uid,
    required this.nickname,
    required this.name,
    required this.email,
    this.imageUrl,
    this.goalList,
    this.friendUidList,
    this.friendTrackList,
  });
}
