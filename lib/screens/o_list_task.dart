import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:institute_assistant_app/providers/task_provider.dart';
import 'package:institute_assistant_app/providers/tasks.dart';
import 'package:provider/provider.dart';

class ListTask extends StatelessWidget {
  String title = '';
  ListTask({Key key, @required this.title});
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<Tasks>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: Text(
          '$title TASK',
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
                  child: Text('${tasksProvider.totaltaskcount().toString()}',
                      style: TextStyle(fontSize: 18.0))),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tasksProvider.getTasks.map((tasks) {
            int taskIndex = tasksProvider.getTasks.indexOf(tasks);
            return (tasks['status'] == '$title' || title == 'TOTAL')
                ? Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.red.shade500,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red.shade800,
                          child: Text(
                            '${tasksProvider.getTasks.indexOf(tasks) + 1}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        title: Text(
                          '${tasks['task']}',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                          caption: 'Upcoming',
                          color: Colors.red.shade400,
                          icon: Icons.add_box_sharp,
                          onTap: () {
                            tasksProvider.updateTask((taskIndex), 'UPCOMING');
                          }),
                      IconSlideAction(
                          caption: 'Progress',
                          color: Colors.black45,
                          icon: Icons.access_time,
                          onTap: () {
                            tasksProvider.updateTask((taskIndex), 'PROGRESS');
                          }),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          caption: 'Removed',
                          color: Colors.black45,
                          icon: Icons.where_to_vote_rounded,
                          onTap: () {
                            tasksProvider.updateTask((taskIndex), 'REMOVED');
                          }),
                      IconSlideAction(
                          caption: 'Completed',
                          color: Colors.red.shade400,
                          icon: Icons.inbox,
                          onTap: () {
                            tasksProvider.updateTask((taskIndex), 'COMPLETED');
                          }),
                    ],
                  )
                : Container();
          }).toList(),
        ),
      ),
    );
  }
}
