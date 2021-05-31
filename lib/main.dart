import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/name_provider.dart';
import 'package:institute_assistant_app/screens/login.dart';
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
        home: Login(),
      ),
    );
  }
}
