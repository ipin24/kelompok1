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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  TextEditingController NIS = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = Uri.http("192.168.1.8", '/taek/regrister2.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "NIS": NIS.text,
      "Password": pass.text,
    });
    var data = json.decode(response.body);
    if (data.toString() == "Success") {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'NIS and password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
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
                      controller: NIS,
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
