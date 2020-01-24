import 'package:flutter/material.dart';
import 'package:ggtt/Page/home_screen.dart';

import 'Page/login_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ThaiSansNeue'),
      home: LoginPage()
    );
  }
}
