import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:institute_assistant_app/screens/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' Create Account',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
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
                          decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.lock_rounded),
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
                      child: Container(
                        child: TextFormField(
                          decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.lock_rounded),
                              labelText: 'Confirm Password',
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
                          width: 130.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  '    Signup   ',
                                  style: TextStyle(color: Colors.white),
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
                            'Already have an account ?',
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
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
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
