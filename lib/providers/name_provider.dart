import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/names.dart';

class NameProvider extends ChangeNotifier {
  String apiUrl = 'dummyapi.io';
  List _names;
  get names => _names;

  void setPlacementList(namesList) {
    _names = namesList;
  }

  Future<List<Names>> fetchData() async {
    if (_names != null) {
      return _names;
    } else {
      var url = Uri.https(apiUrl, '/data/api/user', {'q': '{http}'});
      final response = await http.get(
        url,
        headers: {'app-id': '60b07a3655583ebc46e021dc'},
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
        List<Names> names = jsonResponse
            .map(
              (dynamic item) => Names.fromJson(item),
            )
            .toList();

        return names;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }

  Future<Names> fetchNameData(String userId) async {
    var url = Uri.https(apiUrl, '/data/api/user/$userId', {'q': '{http}'});
    final response = await http.get(
      url,
      headers: {'app-id': '60b07a3655583ebc46e021dc'},
    );
    if (response.statusCode == 200) {
      print(convert.jsonDecode(response.body));
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return Names.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
