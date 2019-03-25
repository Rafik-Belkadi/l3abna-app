import 'package:flutter/material.dart';
import 'login.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(
              hintColor: Colors.white,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.white)
              )
            ),
      title: 'Test',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/home': (_) => new HomePage(),
      },
    );
  }
}




