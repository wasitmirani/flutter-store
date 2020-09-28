import 'package:blog_app/screens/Home.dart';

import './screens/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => Loginscreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/home': (context) => Home(),
        });
  }
}
