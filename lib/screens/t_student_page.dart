import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/classes_provider.dart';
import 'package:institute_assistant_app/screens/t_student_list%20_attendance.dart';
import 'package:provider/provider.dart';

class TStudentPage extends StatelessWidget {
  List cd = ['1 ', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var classProvider = Provider.of<ClassProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: Text(
          'CLASSES & DIVISION',
          style: TextStyle(
            fontSize: 15.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: classProvider.fetchData(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List classes = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newDateTime) {},
                      ),
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: classes.map((items) {
                                  return Column(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: screenHeight / 13.0,
                                            width: screenWidth / 1.1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        Colors.red.shade500),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Name(
                                                                title: '$items',
                                                              )));
                                                },
                                                child: Container(
                                                  child: Text(
                                                    '$items',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
