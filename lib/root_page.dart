import 'package:flutter/material.dart';
import 'Auth/login.dart';
import 'Auth/auth.dart';
import 'Pages/Home.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus _authStatus =AuthStatus.notSignedIn;

  //  Initiating State to current user
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId){
      setState((){
      //  _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  
  void _singedIn(){
    setState(() {
      _authStatus =AuthStatus.signedIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          auth: new Auth(),
          onSignedIn: () => _singedIn(),
        );
      case AuthStatus.signedIn:
        return HomePage();
    }
    
  }
}