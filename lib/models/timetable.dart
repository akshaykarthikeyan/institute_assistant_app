import 'package:flutter/cupertino.dart';

class Timetable {
  final String subject;
  final String date;
  final String start_time;
  final String end_time;

  Timetable({
    @required this.subject,
    @required this.date,
    @required this.start_time,
    @required this.end_time,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      subject: json['subject'] as String,
      date: json['date'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );
  }
}
