import 'package:flutter/material.dart';
import 'package:institute_assistant_app/models/staffs.dart';
import 'package:institute_assistant_app/providers/staff_provider.dart';
import 'package:provider/provider.dart';

class OtherStaffAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var staffProvider = Provider.of<StaffProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'Staffs List',
          style: TextStyle(
            fontSize: 17.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: staffProvider.fetchData(),
          builder: (BuildContext context, AsyncSnapshot<List<Staff>> snapshot) {
            if (snapshot.hasData) {
              List<Staff> staff = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: staff.map((item) {
                    return Card(
                      color: Colors.white60,
                      child: Row(children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                              child: Image.network(
                            '${item.image}',
                            width: screenWidth / 10,
                            height: screenHeight / 12,
                          )),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            width: double.infinity,
                            height: screenHeight / 9.5,
                            child: Row(
                              children: [
                                Container(
                                  width: 10.0,
                                ),
                                Text(
                                  '${item.first_name}'
                                  ' ${item.last_name}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth / 22.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    );
                  }).toList(),
                ),
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
    );
  }
}
