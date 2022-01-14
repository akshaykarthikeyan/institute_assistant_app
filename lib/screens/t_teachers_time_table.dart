import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:institute_assistant_app/providers/timetable_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TeachersTimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachersTimeTables();
  }
}

class TeachersTimeTables extends StatefulWidget {
  @override
  _TeachersTimeTablesState createState() => _TeachersTimeTablesState();
}

class _TeachersTimeTablesState extends State<TeachersTimeTables> {
  @override
  void initState() {
    super.initState();
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    final timetableProvider = Provider.of<TimeTableProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'Timetable',
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 4.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: timetableProvider.fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Calendar(
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                events: snapshot.data,
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.red,
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
                    List<NeatCleanCalendarEvent> _selectedEvent) {
                  return _selectedEvent.length > 0
                      ? SingleChildScrollView(
                          child: Column(
                            children: _selectedEvent
                                .map((timetable) => Container(
                                      color: timetable.color,
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 60,
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
                                                    timetable.summary,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(timetable.description)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 40,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  (timetable.startTime !=
                                                              null &&
                                                          timetable.endTime !=
                                                              null)
                                                      ? Text(
                                                          '${new DateFormat.jm().format(timetable.startTime)} - ${new DateFormat.jm().format(timetable.endTime)}',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : Text(''),
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
