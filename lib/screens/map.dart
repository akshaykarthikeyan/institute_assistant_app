import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: Text(
          'Map',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: Text(
                  'Map Of Institution ',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
                child: Image.asset(
              'assets/images/map.jpg',
              height: 330.0,
              width: double.infinity,
            )),
          ],
        ),
      ),
    );
  }
}
