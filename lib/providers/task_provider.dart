import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:institute_assistant_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  String apiUrl = 'devkit.in';

  Future fetchData() async {
    final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {};
    var url =
        Uri.https(apiUrl, '/projects/academy/api/tasks/15203', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
      List<Task> tasks = jsonResponse
          .map(
            (dynamic item) => Task.fromJson(item),
          )
          .toList();
      tasks
          .map((task) => {
                _events[DateTime.parse('${task.date}')] = [
                  NeatCleanCalendarEvent(
                    '${task.task}',
                    startTime: DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day, 0, 0),
                    endTime: DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day, 12, 0),
                    isAllDay: true,
                    color: status(task.status),
                  ),
                ]
              })
          .toList();
      return _events;
    } else {
      return [];
    }
  }

  Color status(String status) {
    switch (status) {
      case 'COMPLETED':
        return Colors.green;
        break;
      case 'INCOMPLETE':
        return Colors.red;
        break;
      case 'REMOVED':
        return Colors.grey;
        break;
      case 'PROGRESS':
        return Colors.blue;
        break;
    }
  }
}
