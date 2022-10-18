import 'dart:convert';
import 'package:example/screens/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/screens/loginView.dart';
import 'package:example/screens/regristerView.dart';
import 'package:example/widgets/custom_checkbox.dart';
import 'package:example/widgets/input_field.dart';
import 'package:example/widgets/primary_button.dart';
import 'package:example/theme.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  TextEditingController nis = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    if (nis.text.isEmpty && pass.text.isEmpty) {
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
    } else if (pass.text.isEmpty) {
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
        msg: 'Login....',
        progressBgColor: Colors.transparent,
      );
      for (int i = 0; i <= 100; i++) {
        /// You don't need to update state, just pass the value.
        /// Only value required
        pd.update(value: i);
        i++;
        await Future.delayed(Duration(milliseconds: 50));
      }

      var url = Uri.http("192.168.1.24", '/taek/login.php', {'q': '{http}'});
      var response = await http.post(url, body: {
        "NIS": nis.text,
        "Password": pass.text,
      });
      var data = json.encode(response.body);

      if (data == "Success") {
        Alert(
                context: context,
                title: "Login Berhasil",
                type: AlertType.success)
            .show();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
      } else {
        Alert(context: context, title: "Login Gagal", type: AlertType.error)
            .show();
      }
    }
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/gambar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk MyCanteen',
                    style: heading1.copyWith(color: textBlack),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: nis,
                      decoration: InputDecoration(
                          hintText: 'NIS',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: pass,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Belum Punya Akun?',
                      style: TextStyle(fontSize: 13, color: primaryBlue),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Remember me',
                    style: regular16pt,
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              CustomPrimaryButton(
                  buttonColor: primaryBlue,
                  textValue: 'Login',
                  textColor: Colors.white,
                  onPressed: () {
                    login();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
