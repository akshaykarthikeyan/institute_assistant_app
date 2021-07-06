import 'package:flutter/cupertino.dart';

class Task {
  final String task;
  final String date;
  final String status;

  Task({
    @required this.task,
    @required this.date,
    @required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );
  }
}
