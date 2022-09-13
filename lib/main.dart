// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, avoid_function_literals_in_foreach_calls

    import 'package:flutter/material.dart';
import './launcher.dart';
    
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
    
      //fungsi ini akan dijalankan setiap kalian typing/mengetik
      //fungsi ini akan mencari nama sesuai yang diketikkan
      _searchName(String name) {
        if (name.isNotEmpty) {
          setState(() {
            list.clear();
            //melakukan perulangan/looping
            items.forEach((item) {
              //jika list data ada yang mengandung susunan huruf yang dicari
              //maka masukan ke dalam data list
              if (item.toLowerCase().contains(name.toLowerCase())) {
                list.add(item);
              }
            });
          });
        } else {
          setState(() {
            list.clear();
            list.addAll(items);
          });
        }
      }
    }
