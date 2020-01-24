import 'package:firebase_auth/firebase_auth.dart';
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
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPage();
              }
            }));
  }
}
