import 'package:flutter/material.dart';
import 'package:institute_assistant_app/providers/tasks.dart';
import 'package:institute_assistant_app/screens/o_add_task.dart';
import 'package:institute_assistant_app/screens/o_list_task.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Tasks>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'TASKS',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 4.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'UPCOMING'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${taskProvider.upcomingtasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'UPCOMING',
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
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'PROGRESS'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${taskProvider.progresstasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'PROGRESS',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListTask(title: 'COMPLETED'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${taskProvider.completedtasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'COMPLETED',
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
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'REMOVED'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${taskProvider.removedtasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'REMOVED',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'TOTAL'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TOTAL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${taskProvider.tasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
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
