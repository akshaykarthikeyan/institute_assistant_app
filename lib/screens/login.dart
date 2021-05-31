import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/screens/signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fieldText = TextEditingController();
    var fieldText1 = TextEditingController();
    var fieldText2 = TextEditingController();
    String inputText = '';
    String inputText1 = '';
    String inputText2 = '';
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                        child: TextFormField(
                          controller: fieldText,
                          onChanged: (text) {
                            inputText = text;
                          },
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              labelText: 'Email',
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
                                Icons.person,
                              ),
                              labelText: 'Name',
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
                          controller: fieldText2,
                          onChanged: (text) {
                            inputText2 = text;
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
                                    print(inputText2);
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white, elevation: 100.0),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
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
