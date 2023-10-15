import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'goal_model.g.dart';

@JsonSerializable()
class GoalModel {
  String goalName;
  String colorCode;
  DateTime startDate;
  List<TrackModel>? trackList;

  GoalModel({
    required this.goalName,
    required this.colorCode,
    required this.startDate,
    this.trackList,
  });

  // factory GoalModel.fromJson(Map<String, dynamic> json) =>
  //     _$GoalModelFromJson(json);

  // Map<String, dynamic> toJson() => _$GoalModelToJson(this);
  factory GoalModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GoalModel(
        goalName: data?['goalName'],
        colorCode: data?['colorCode'],
        startDate: data?['startDate'],
        trackList: data?['trackList']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "goalName": goalName,
      "colorCode": colorCode,
      "startDate": startDate,
      if (trackList != null) "trackList": trackList
    };
  }
}
