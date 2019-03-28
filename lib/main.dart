import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'root_page.dart';
import 'Auth/auth.dart';

import 'Pages/Home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

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
      title: 'L3abna?',
      home: RootPage(auth: new Auth()),
      routes: {
        
        '/home'         : (context) => HomePage(),
        
      },
    );
  }
}




