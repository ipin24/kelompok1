import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 40, 150, 114),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 30, 111, 92),
          title: Text("My Canteen"),
        ),
      ),
    );
  }
}
