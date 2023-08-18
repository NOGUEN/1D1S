import 'package:json_annotation/json_annotation.dart';

part 'track_model.g.dart';

@JsonSerializable()
class TrackModel {
  String title;
  DateTime date;
  String? description;

  TrackModel({
    required this.title,
    required this.date,
    this.description,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackModelToJson(this);
}
