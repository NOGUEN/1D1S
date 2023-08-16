import 'package:one_day_one_something/app/data/model/firebase/track_model.dart';

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
}
