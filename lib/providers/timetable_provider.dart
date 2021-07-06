import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/timetable.dart';

class TimeTableProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';

  Future fetchData() async {
    final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {};
    var url = Uri.https(
        apiUrl, '/projects/academy/api/timetable/195001', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
      List<Timetable> timetables = jsonResponse
          .map(
            (dynamic item) => Timetable.fromJson(item),
          )
          .toList();
      timetables
          .map((timetable) => {
                _events[DateTime.parse('${timetable.date}')] = [
                  NeatCleanCalendarEvent(
                    '${timetable.subject}',
                    startTime: DateTime.tryParse(
                        '${timetable.date} ${timetable.start_time}'),
                    endTime: DateTime.tryParse(
                        '${timetable.date} ${timetable.end_time}'),
                    color: subject(timetable.subject),
                  ),
                ]
              })
          .toList();
      return _events;
    } else {
      return [];
    }
  }

  Color subject(String subject) {
    switch (subject) {
      case 'MATHS':
        return Colors.green;
        break;
      case 'LANGUAGE':
        return Colors.red;
        break;
      case 'SCIENCE':
        return Colors.black54;
        break;
      case 'ENGLISH':
        return Colors.blue;
        break;
    }
  }
}
