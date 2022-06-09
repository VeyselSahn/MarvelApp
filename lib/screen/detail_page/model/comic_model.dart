import 'package:intl/intl.dart';

class ComicModel {
  final int id;
  String? title;
  String? description;
  int? date;
  String? photoUrl;

  ComicModel({required this.id, this.title, this.description, this.date, this.photoUrl});

  factory ComicModel.fromJson(Map? map) {
    return ComicModel(
        id: map?['id'],
        title: map?['title'] ?? '',
        description: map?['description'] ?? '',
        date: DateFormat.y().parse(map?['dates'][0]['date'] ?? '').year,
        photoUrl: (map?['thumbnail']['path'] + '/portrait_xlarge.' + map?['thumbnail']['extension']));
  }
}
