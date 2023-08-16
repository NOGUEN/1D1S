import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';
import 'package:json_annotation/json_annotation.dart';

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

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);
}
