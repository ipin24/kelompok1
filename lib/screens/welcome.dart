import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/screens/regristerView.dart';
import 'package:example/screens/loginView.dart';
import 'package:example/theme.dart';
import 'package:example/widgets/custom_checkbox.dart';
import 'package:example/widgets/primary_button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 630,
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                width: 100,
              ),
            ),
            GestureDetector(
              child: CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Masuk',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: CustomPrimaryButton(
                  buttonColor: colorLight,
                  textValue: 'Daftar',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
