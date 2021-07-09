import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:institute_assistant_app/providers/classes_provider.dart';
import 'package:institute_assistant_app/providers/staff_provider.dart';
import 'package:institute_assistant_app/providers/student_provider.dart';
import 'package:institute_assistant_app/providers/task_provider.dart';
import 'package:institute_assistant_app/providers/tasks.dart';
import 'package:institute_assistant_app/providers/teacher_provider.dart';
import 'package:institute_assistant_app/providers/timetable_provider.dart';
import 'package:institute_assistant_app/screens/login.dart';
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
        ChangeNotifierProvider<ClassProvider>(create: (_) => ClassProvider()),
        ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider()),
        ChangeNotifierProvider<TimeTableProvider>(
            create: (_) => TimeTableProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Institute assistant app',
        builder: EasyLoading.init(),
        home: DoubleBack(
          message: "Press back again to close",
          child: Login(),
        ),
      ),
    );
  }
}
