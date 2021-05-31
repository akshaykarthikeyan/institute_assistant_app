import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/tasks.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  var fieldText = TextEditingController();
  var fieldText2 = TextEditingController();
  String inputText = '';
  String inputText2 = '';

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Tasks>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'TASK',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40.0,
                decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: BorderRadiusDirectional.circular(30.0)),
                child: Center(
                    child: Text('${taskProvider.tasksCount().toString()}',
                        style: TextStyle(fontSize: 18.0))),
              ),
            )
          ],
          backgroundColor: Colors.red.shade500,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red.shade500,
                child: TextFormField(
                  controller: fieldText,
                  onChanged: (text) {
                    inputText = text;
                  },
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Enter a task',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  maxLines: 6,
                  style: TextStyle(color: Colors.black, fontSize: 23.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red.shade500,
                child: TextFormField(
                  controller: fieldText2,
                  onChanged: (text) {
                    inputText2 = text;
                  },
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Status',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 23.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                print(inputText);
                print(inputText2);
                taskProvider
                    .addTasks({'task': inputText, 'status': inputText2});
                fieldText.clear();
                fieldText2.clear();
              },
              style: TextButton.styleFrom(
                primary: Colors.red.shade500,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
