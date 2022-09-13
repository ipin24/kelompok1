import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilku'),
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 71, 53, 53),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
            Image.asset('assets/editim.png',height: 50,width: 50,),
          
            Image.asset('assets/profile.png',height: 190,width:190,),
            
        ]
        )
      )
    );
  }
}