import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './regristerView.dart';
import './loginView.dart';
import './theme.dart';
import './widgets/custom_checkbox.dart';
import './widgets/primary_button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Masuk',
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Daftar',
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
