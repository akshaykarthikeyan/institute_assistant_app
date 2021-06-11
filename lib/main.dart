import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/staff_provider.dart';
import 'package:institute_assistant_app/providers/student_provider.dart';
import 'package:institute_assistant_app/providers/tasks.dart';
import 'package:institute_assistant_app/providers/teacher_provider.dart';
import 'package:institute_assistant_app/screens/s_teachers_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StudentProvider>(
            create: (_) => StudentProvider()),
        ChangeNotifierProvider<TeachersProvider>(
            create: (_) => TeachersProvider()),
        ChangeNotifierProvider<StaffProvider>(create: (_) => StaffProvider()),
        ChangeNotifierProvider<Tasks>(create: (_) => Tasks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Institute assistant app',
        home: TeachersAttendanceView(),
      ),
    );
  }
}
