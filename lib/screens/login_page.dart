import 'package:blog_app/data/User.dart';
import 'package:blog_app/model/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:blog_app/data/User.dart';
import 'package:http/http.dart' as http;
import '../Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // var _base = "http://6f024a03defc.ngrok.io/api";
  // var _tokenEndpoint = "/user/login";
  var _tokenURL = "http://6f024a03defc.ngrok.io/api/user/login";

  Future<Token> getToken(UserLogin userLogin) async {
    print(_tokenURL);
    print("users=" + jsonEncode(userLogin));
    final http.Response response = await http.post(
      _tokenURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userLogin.toDatabaseJson()),
    );
    print(userLogin.toDatabaseJson());
    if (response.statusCode == 200) {
      print(response.body);
      return Token.fromJson(json.decode(response.body));
    } else {
      print(json.decode(response.body).toString());
      throw Exception(json.decode(response.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
        begin: Alignment.topCenter,
        colors: [Colors.blue[900], Colors.blue[800], Colors.blue[400]]);
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: linearGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(32, 132, 232, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: password,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('forget working working');
                          },
                          child: Container(
                            child: FadeAnimation(
                                1.5,
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                          1.6,
                          FlatButton(
                            onPressed: () {
                              getToken(UserLogin(
                                  email: email.text, password: password.text));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue[900]),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FadeAnimation(
                            1.7,
                            Text(
                              "Continue with social media  & OTP",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: FadeAnimation(
                                  1.8,
                                  Container(
                                      child: MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xFF3b5998),
                                    textColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    shape: CircleBorder(),
                                  ))),
                            ),
                            // SizedBox(width: 10,),
                            Container(
                              child: FadeAnimation(
                                  1.9,
                                  Container(
                                      child: MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xFFEA4335),
                                    textColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    shape: CircleBorder(),
                                  ))),
                            ),
                            Container(
                              child: FadeAnimation(
                                  1.9,
                                  Container(
                                      child: MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xFF34A853),
                                    textColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.mobileAlt,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    shape: CircleBorder(),
                                  ))),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            print('sign up working');
                          },
                          child: Container(
                            child: FadeAnimation(
                                1.5,
                                Text(
                                  "Don't have an Account? Sign Up",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
