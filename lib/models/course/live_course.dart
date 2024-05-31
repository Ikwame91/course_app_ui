// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_english_course/models/course/course.dart';
import 'package:flutter_english_course/models/course/teacher.dart';

class LiveCourse extends Course {
  final String liveStreamingUrl;
  final String liveDuration;
  final DateTime liveTime;

  LiveCourse(
      {required super.id,
      required super.title,
      required super.description,
      required super.level,
      required super.imageUrl,
      required super.teacher,
      required this.liveStreamingUrl,
      required this.liveDuration,
      required this.liveTime,
      super.countStudents = 0,
      required super.createdAt});

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'liveStreamingUrl': liveStreamingUrl,
  //     'liveDuration': liveDuration,
  //     'liveTime': liveTime.millisecondsSinceEpoch,
  //   };
  // }

  factory LiveCourse.fromJson(Map<String, dynamic> json) {
    return LiveCourse(
      id: int.tryParse(json["id"].toString()) ?? 0,
      title: json["title"],
      description: json["description"],
      level: json["level"],
      imageUrl: json["imageUrl"],
      teacher: Teacher.fromJson(json["teacher"]),
      liveTime: DateTime.parse(json["liveTime"].toString()),
      liveStreamingUrl: json["liveStreamingUrl"],
      liveDuration: json["liveDuration"],
      countStudents: int.tryParse(json["countStudents"].toString()) ?? 0,
      createdAt: DateTime.parse(json["createdAt"].toString()).toLocal(),
    );
  }
}
