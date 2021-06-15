import 'package:flutter/material.dart';
import 'package:institute_assistant_app/models/teachers.dart';
import 'package:institute_assistant_app/providers/teacher_provider.dart';
import 'package:institute_assistant_app/screens/teachers_profile.dart';
import 'package:provider/provider.dart';

class TeachersAttendanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var teachersProvider = Provider.of<TeachersProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'Teachers List',
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
          future: teachersProvider.fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Teacher>> snapshot) {
            if (snapshot.hasData) {
              List<Teacher> teacher = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teacher.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeacherNameProfile(
                                    first_name: item.first_name,
                                    last_name: item.last_name,
                                    email: item.email,
                                    image: item.image,
                                    gender: item.gender)));
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
