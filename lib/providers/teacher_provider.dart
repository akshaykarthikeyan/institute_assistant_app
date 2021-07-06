import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/teachers.dart';

class TeachersProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';
  List _teachers;
  get teachers => _teachers;

  void setPlacementList(teacherList) {
    _teachers = teacherList;
  }

  Future<List<Teacher>> fetchData() async {
    if (_teachers != null) {
      return _teachers;
    } else {}
    final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {};
    var url =
        Uri.https(apiUrl, 'projects/academy/api/teachers', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
      List<Teacher> _teachers = jsonResponse
          .map(
            (dynamic item) => Teacher.fromJson(item),
          )
          .toList();
      return _teachers;
    } else {
      return [];
    }
  }
}
