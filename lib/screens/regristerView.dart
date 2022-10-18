// import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:http/http.dart' show get;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:example/screens/Dashboard.dart';
import 'package:example/screens/loginView.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/input_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../theme.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/primary_button.dart';

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
  TextEditingController nis = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();

  Future regrister() async {
    // print(data);
    if (nis.text.isEmpty && nama.text.isEmpty && password.text.isEmpty) {
      Alert(
              context: context,
              title: "Data Tidak Boleh Kosong",
              type: AlertType.error)
          .show();
    } else if (nis.text.isEmpty) {
      Alert(
              context: context,
              title: "NIS Tidak Boleh Kosong",
              type: AlertType.error)
          .show();
    } else if (nama.text.isEmpty) {
      Alert(
              context: context,
              title: "Password Tidak Boleh Kosong",
              type: AlertType.error)
          .show();
    } else if (password.text.isEmpty) {
      Alert(
              context: context,
              title: "Password Tidak Boleh Kosong",
              type: AlertType.error)
          .show();
    } else {
      ProgressDialog pd = ProgressDialog(context: context);

      /// Set options
      /// Max and msg required
      pd.show(
        max: 100,
        msg: 'Daftar....',
        progressBgColor: Colors.transparent,
      );
      for (int i = 0; i <= 100; i++) {
        /// You don't need to update state, just pass the value.
        /// Only value required
        pd.update(value: i);
        i++;
        await Future.delayed(Duration(milliseconds: 50));
      }
      var url =
          Uri.http("192.168.1.24", "/taek/regrister.php", {'q': '{http}'});
      var response = await http.post(url, body: {
        "NIS": nis.text,
        "Nama": nama.text.toString(),
        "Password": password.text.toString()
      });
      var data = json.encode(response.body);
      if (data == "Error") {
        Alert(
                context: context,
                title: "NIS Sudah Terdaftar",
                type: AlertType.error)
            .show();
        ;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
        Alert(
                context: context,
                title: "Berhasil Membuat Akun",
                type: AlertType.success)
            .show();
      }
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
                        controller: nis,
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
                        controller: nama,
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
                        controller: password,
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
