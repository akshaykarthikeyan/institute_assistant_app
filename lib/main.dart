import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/name_provider.dart';
import 'package:institute_assistant_app/screens/s_students_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NameProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Institute assistant app',
        home: StudentsHomePage(),
      ),
    );
  }
}
