import 'package:flutter/cupertino.dart';

class Student {
  final String student_id;
  final String first_name;
  final String last_name;
  final String email;
  final String image;
  final String gender;

  Student({
    @required this.student_id,
    @required this.first_name,
    @required this.last_name,
    @required this.email,
    @required this.image,
    @required this.gender,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      student_id: json['student_id'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
    );
  }
}
