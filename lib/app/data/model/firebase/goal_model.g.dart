// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => GoalModel(
      goalName: json['goalName'] as String,
      colorCode: json['colorCode'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      trackList: (json['trackList'] as List<dynamic>?)
          ?.map((e) => TrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalModelToJson(GoalModel instance) => <String, dynamic>{
      'goalName': instance.goalName,
      'colorCode': instance.colorCode,
      'startDate': instance.startDate.toIso8601String(),
      'trackList': instance.trackList,
    };
