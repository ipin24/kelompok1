import 'package:flutter/material.dart';
import 'package:example/screens/launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCanteen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LauncherPage(),
    );
  }
}
