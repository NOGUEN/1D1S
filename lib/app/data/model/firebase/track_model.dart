class TrackModel {
  String title;
  DateTime date;
  String? description;

  TrackModel({
    required this.title,
    required this.date,
    this.description,
  });
}
