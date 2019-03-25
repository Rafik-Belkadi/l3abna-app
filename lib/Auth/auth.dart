import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser(); 

}




class Auth implements BaseAuth{

  //  Sign in function returning user id
  Future<String> signInWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
  //  Create user method returns user id
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  //  Check user connected or not
  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return  user.uid;
  }

}