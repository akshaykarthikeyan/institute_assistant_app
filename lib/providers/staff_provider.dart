import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/staffs.dart';

class StaffProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';
  List _staff;
  get staff => _staff;

  void setPlacementList(studentList) {
    _staff = studentList;
  }

  Future<List<Staff>> fetchData() async {
    if (_staff != null) {
      return _staff;
    } else {
      var url =
          Uri.https(apiUrl, '/projects/academy/api/staffs', {'q': '{http}'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
        List<Staff> _staff = jsonResponse
            .map(
              (dynamic item) => Staff.fromJson(item),
            )
            .toList();
        return _staff;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }

  Future<Staff> fetchNameData(String userId) async {
    var url = Uri.https(
        apiUrl, '/projects/academy/api/staffs/$userId', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return Staff.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
