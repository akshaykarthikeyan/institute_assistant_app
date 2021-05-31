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
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                color: Colors.white,
                child: Text(
                  'Map Of Institution ',
                  style: TextStyle(fontSize: 20.0),
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
