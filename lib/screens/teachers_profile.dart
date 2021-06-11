import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/models/teachers.dart';
import 'package:institute_assistant_app/providers/teacher_provider.dart';
import 'package:provider/provider.dart';

class TeacherNameProfile extends StatelessWidget {
  final String userid;
  final String name;
  TeacherNameProfile({Key key, @required this.userid, @required this.name});
  @override
  Widget build(BuildContext context) {
    var teachersProvider = Provider.of<TeachersProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: Text(
          'TEACHERS  PROFILE',
          style: TextStyle(
            fontSize: 17.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: teachersProvider.fetchNameData(userid),
            builder: (BuildContext context, AsyncSnapshot<Teacher> snapshot) {
              if (snapshot.hasData) {
                var teachers = snapshot.data;
                return Column(
                  children: [
                    Container(
                      height: screenHeight / 3.2,
                      width: double.infinity,
                      color: Colors.red.shade500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: screenWidth / 2.8,
                            height: screenHeight / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('${teachers.image}'),
                                fit: BoxFit.fitWidth,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            '${teachers.first_name}' ' ${teachers.last_name}',
                            style: TextStyle(
                              fontSize: 21.0,
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${teachers.email}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wc_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                height: 30.0,
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${teachers.gender}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
