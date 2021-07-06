import 'package:flutter/material.dart';
import 'package:institute_assistant_app/models/students.dart';
import 'package:institute_assistant_app/providers/student_provider.dart';
import 'package:institute_assistant_app/screens/s_students_profile.dart';
import 'package:provider/provider.dart';

class StudentAttendanceView extends StatelessWidget {
  String title = '';
  StudentAttendanceView({Key key, @required this.title});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'CLASS $title',
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
          future: studentProvider.fetchData(this.title),
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.hasData) {
              List<Student> students = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: students.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NameProfile(
                                      student_id: '${item.student_id}',
                                      first_name:
                                          '${item.first_name} ${item.last_name}',
                                      email: '${item.email}',
                                      gender: '${item.gender}',
                                    )));
                      },
                      child: Card(
                        color: Colors.white60,
                        child: Row(children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: Image.network(
                              '${item.image}',
                              width: screenWidth / 10,
                              height: screenHeight / 12,
                            )),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              width: double.infinity,
                              height: screenHeight / 9.5,
                              child: Row(
                                children: [
                                  Container(
                                    width: 10.0,
                                  ),
                                  Text(
                                    '${item.first_name}'
                                    ' ${item.last_name}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth / 22.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return Container(
                height: screenHeight / 1.5,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
