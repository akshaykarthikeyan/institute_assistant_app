import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/screens/map.dart';
import 'package:institute_assistant_app/screens/o_home.dart';
import 'package:institute_assistant_app/screens/o_otherstaff_attendance.dart';

class OtherStaffHomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/saveexam.jpg',
    'assets/images/modeltest2.png',
    'assets/images/modeltest.png',
    'assets/images/bankexam.png',
    'assets/images/catexam.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight / 12,
                    child: Column(
                      children: [
                        Text('INSTITUTE  ASSISTANT',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold)),
                        Text('An assistant of institution',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: screenWidth / 4,
                          width: screenWidth / 1.12,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.work_outline_outlined,
                                size: 45.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Task',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtherStaffAttendance(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: screenWidth / 4,
                          width: screenWidth / 1.12,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.apartment_outlined,
                                size: 45.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Attendance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Map(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: screenWidth / 4,
                          width: screenWidth / 1.12,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.apartment_outlined,
                                size: 45.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Map',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
