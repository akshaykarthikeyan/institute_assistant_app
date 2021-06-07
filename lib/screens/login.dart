import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/screens/o_otherstaff_home_page.dart';
import 'package:institute_assistant_app/screens/s_students_home_page.dart';
import 'package:institute_assistant_app/screens/t_teachers_home_page.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> _category = ['students', 'teachers', 'staffs'];
  String _password;
  String _selectedLocation;
  int _selectedLocationIndex;

  @override
  Widget build(BuildContext context) {
    var fieldText = TextEditingController();
    var fieldText1 = TextEditingController();
    String inputText = '';
    String inputText1 = '';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '  Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '     Please sign in to continue',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.category_outlined,
                            ),
                          ),
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down),
                          hint: Text(
                              'Choose Category'), // Not necessary for Option 1
                          value: _selectedLocationIndex == null
                              ? null
                              : _category[_selectedLocationIndex],
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          items: _category.map((location) {
                            return DropdownMenuItem(
                              child: Text(
                                '${location[0].toUpperCase() + location.substring(1)}',
                                textAlign: TextAlign.center,
                              ),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: fieldText,
                          onChanged: (text) {
                            inputText = text;
                          },
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.perm_identity,
                              ),
                              labelText: 'User ID',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: fieldText1,
                          onChanged: (text) {
                            inputText1 = text;
                          },
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                              )),
                          validator: (val) =>
                              val.length < 4 ? 'Password too short' : null,
                          onSaved: (val) => _password = val,
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 150.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade500,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_selectedLocation != null &&
                                          inputText == 'students' &&
                                          inputText1 == 'students') {
                                        if (_selectedLocation == 'students') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StudentsHomePage()));
                                        }
                                      } else {
                                        print('failed');
                                      }
                                      if (_selectedLocation != null &&
                                          inputText == 'teachers' &&
                                          inputText1 == 'teachers') {
                                        if (_selectedLocation == 'teachers') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeachersHomePage()));
                                        }
                                      } else {
                                        print('failed');
                                      }
                                      if (_selectedLocation != null &&
                                          inputText == 'staffs' &&
                                          inputText1 == 'staffs') {
                                        if (_selectedLocation == "staffs") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtherStaffHomePage()));
                                        }
                                      } else {
                                        print('failed');
                                      }
                                    });
                                  },
                                  child: Text(
                                    '      Login     ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
