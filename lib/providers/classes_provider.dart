import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ClassProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';
  List _class;
  get classes => _class;

  void setPlacementList(classList) {
    _class = classList;
  }

  Future<List> fetchData() async {
    if (_class != null) {
      return _class;
    } else {
      print('data');
      var url =
          Uri.https(apiUrl, '/projects/academy/api/classes', {'q': '{http}'});
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
        return jsonResponse;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }
}
