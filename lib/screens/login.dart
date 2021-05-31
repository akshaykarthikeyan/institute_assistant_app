import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> _category = ['Students', 'Teachers', 'Staffs'];
  String _selectedCategory;

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
                      height: 100.0,
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
                    Container(
                      width: 330.0,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                            '  Choose Category'), // Not necessary for Option 1
                        value: _selectedCategory,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        },
                        items: _category.map((location) {
                          return DropdownMenuItem(
                            child: Text(location),
                            value: location,
                          );
                        }).toList(),
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
                                Icons.lock_rounded,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                              )),
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
                                    print(inputText);
                                    print(inputText1);
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
