import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './regristerView.dart';
import './loginView.dart';
import '../theme.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/primary_button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.blue,
              height: 100,
              width: 100,
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
