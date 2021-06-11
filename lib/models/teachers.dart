import 'package:flutter/cupertino.dart';

class Teacher {
  final String teacher_id;
  final String first_name;
  final String last_name;
  final String email;
  final String image;
  final String gender;

  Teacher({
    @required this.teacher_id,
    @required this.first_name,
    @required this.last_name,
    @required this.email,
    @required this.image,
    @required this.gender,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      teacher_id: json['teacher_id'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
    );
  }
}
