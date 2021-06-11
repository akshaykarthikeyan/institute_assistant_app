import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/students.dart';

class StudentProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';
  List _students;
  get student => _students;

  void setPlacementList(studentList) {
    _students = studentList;
  }

  Future<List<Student>> fetchData() async {
    if (_students != null) {
      return _students;
    } else {
      var url =
          Uri.https(apiUrl, '/projects/academy/api/students', {'q': '{http}'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
        List<Student> _students = jsonResponse
            .map(
              (dynamic item) => Student.fromJson(item),
            )
            .toList();
        return _students;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }

  Future<Student> fetchNameData(String userid) async {
    var url = Uri.https(
        apiUrl, '/projects/academy/api/students/$userid', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return Student.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
