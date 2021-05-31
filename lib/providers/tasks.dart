import 'package:flutter/widgets.dart';

class Tasks extends ChangeNotifier {
  final List _tasks = [
    {'task': 'task 1', 'status': 'PROGRESS'},
    {'task': 'task 2', 'status': 'UPCOMING'},
    {'task': 'task 3', 'status': 'PROGRESS'},
    {'task': 'task 4', 'status': 'REMOVED'},
    {'task': 'task 5', 'status': 'UPCOMING'},
    {'task': 'task 6', 'status': 'PROGRESS'},
  ];

  List getTask() {
    return _tasks;
  }

  //function to return total tasks
  int tasksCount() {
    return _tasks.length;
  }

  int totaltaskcount() {
    return _tasks.length;
  }

  int upcomingtasksCount() {
    int total = 0;
    _tasks.map((e) {
      if (e['status'] == 'UPCOMING') {
        total = total + 1;
      }
    }).toList();
    return total;
  }

  int progresstasksCount() {
    int total = 0;
    _tasks.map((e) {
      if (e['status'] == 'PROGRESS') {
        total = total + 1;
      }
    }).toList();
    return total;
  }

  int completedtasksCount() {
    int total = 0;
    _tasks.map((e) {
      if (e['status'] == 'COMPLETED') {
        total = total + 1;
      }
    }).toList();
    return total;
  }

  int removedtasksCount() {
    int total = 0;
    _tasks.map((e) {
      if (e['status'] == 'REMOVED') {
        total = total + 1;
      }
    }).toList();
    return total;
  }

  List get getTasks {
    return [..._tasks];
  }

  void updateTask(index, status) {
    _tasks[index]['status'] = status;
    notifyListeners();
  }

  //function to add tasks
  void addTasks(task) {
    _tasks.add(task);
    print(_tasks);
    notifyListeners();
  }
}
