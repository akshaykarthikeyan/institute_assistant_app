import 'package:flutter/material.dart';
import 'package:institute_assistant_app/models/names.dart';
import 'package:institute_assistant_app/providers/name_provider.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:provider/provider.dart';

class TeachersAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var nameProvider = Provider.of<NameProvider>(context);
    return FutureBuilder(
      future: nameProvider.fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Names>> snapshot) {
        if (snapshot.hasData) {
          List<Names> names = snapshot.data;
          return AttendanceNames(
            mainList: names,
          );
        } else {
          return Container(
            color: Colors.white,
            height: screenHeight / 1.5,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class AttendanceNames extends StatefulWidget {
  final List mainList;
  const AttendanceNames({Key key, @required this.mainList}) : super(key: key);

  @override
  _AttendanceNamesState createState() =>
      _AttendanceNamesState(mainList: this.mainList);
}

class _AttendanceNamesState extends State<AttendanceNames> {
  List mainList;
  _AttendanceNamesState({this.mainList});
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();
    controller.set(mainList.length);
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        var before = !controller.isSelecting;
        setState(() {
          controller.deselectAll();
        });
        return before;
      },
      child: new Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        appBar: new AppBar(
          backgroundColor: Colors.red.shade500,
          title: new Text(
            ' Selected ${controller.selectedIndexes.length} ',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: (controller.isSelecting)
              ? <Widget>[
                  IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: selectAll,
                  ),
                ]
              : <Widget>[],
        ),
        body: ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: MultiSelectItem(
                isSelecting: controller.isSelecting,
                onSelected: () {
                  setState(() {
                    controller.toggle(index);
                  });
                },
                child: Card(
                  child: ListTile(
                    title: new Text(
                      "${mainList[index].firstName} ${mainList[index].lastName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 24.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(3.0),
                      child: Image.network(
                        '${mainList[index].picture}',
                        width: screenWidth / 9,
                      ),
                    ),
                    trailing: controller.isSelected(index)
                        ? new Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          )
                        : new Icon(Icons.check_circle_outline),
                  ),
                  color: controller.isSelected(index)
                      ? Colors.grey[300]
                      : Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
