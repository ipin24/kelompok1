// import 'dart:html';
import 'dart:convert';

import 'package:example/screens/Dashboard.dart';
import 'package:example/screens/loginView.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/input_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../theme.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/primary_button.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController NIS = TextEditingController();
  TextEditingController Nama = TextEditingController();
  TextEditingController Password = TextEditingController();

  Future regrister() async {
    var url = Uri.http("192.168.1.8", "/taek/regrister.php", {'q': '{http}'});
    var response = await http.post(url, body: {
      "NIS": NIS.text,
      "Nama": Nama.text.toString(),
      "Password": Password.text.toString()
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'User already exit!',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'Registration Successful',
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'APP Flutter\nRegister',
                  style: heading2.copyWith(color: textBlack),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/gambar.png',
                  width: 99,
                  height: 4,
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: NIS,
                        decoration: InputDecoration(
                            hintText: 'NIS',
                            hintStyle: heading6.copyWith(color: textGrey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: Nama,
                        decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: heading6.copyWith(color: textGrey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: Password,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                            hintText: 'Password ',
                            hintStyle: heading6.copyWith(color: textGrey),
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckbox(),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By creating an account, you agree to our',
                      style: regular16pt.copyWith(color: textGrey),
                    ),
                    Text(
                      'Term & Condition',
                      style: regular16pt.copyWith(color: primaryBlue),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            CustomPrimaryButton(
                buttonColor: primaryBlue,
                textValue: 'Register',
                textColor: Colors.white,
                onPressed: () {
                  regrister();
                }),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: regular16pt.copyWith(color: textGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: regular16pt.copyWith(color: primaryBlue),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
