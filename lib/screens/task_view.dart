import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:institute_assistant_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TaskViewFul();
  }
}

class TaskViewFul extends StatefulWidget {
  @override
  _TaskViewFulState createState() => _TaskViewFulState();
}

class _TaskViewFulState extends State<TaskViewFul> {
  @override
  void initState() {
    super.initState();
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'Task View',
          style: TextStyle(
            fontSize: 17.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: taskProvider.fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Calendar(
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                events: snapshot.data,
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.blue,
                eventColor: Colors.grey,
                locale: 'en_us',
                isExpanded: false,
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                dayOfWeekStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
                eventListBuilder: (BuildContext context,
                    List<NeatCleanCalendarEvent> _selectedEvents) {
                  return _selectedEvents.length > 0
                      ? SingleChildScrollView(
                          child: Column(
                            children: _selectedEvents
                                .map((task) => Container(
                                      color: task.color,
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    task.summary,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(task.description)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      : Container();
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
