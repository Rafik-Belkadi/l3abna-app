import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {

  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Check signup or signin class
enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  //  Email and password vars
  String _password, _email;

  //  Register form vars
  String _confirmation, _name, _surname, _username;

  //  formkey for login form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //  Form Type to check wether its register or login
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            minimum: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Container(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: buildLoginInputs() + buildLoginButtons()),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

/*  Logic related methods */

  //  Change form to Register form
  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  //  Change form to Login form
  void moveToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  // Form Validation Method method
  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Signup method
  void signup(BuildContext context) async {
    if (validateAndSave()){
      try {
        String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
        widget.onSignedIn();
      }catch(e){
        print(e);
      }
    }
  }

  // Form Validation and submition
  void login(BuildContext context) async {
    if (validateAndSave()) {
      try {
        String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
        widget.onSignedIn(); 
      } catch (e) {
        print(e);
      }
    }
  }

/*  Methods of components */
  // Login & Register Inputs widget methods (refractoring)
  List<Widget> buildLoginInputs() {
    if (_formType == FormType.register) {
      return [
        
        TextFormField(
          validator: (input) =>
              input.isEmpty ? 'Veuillez remplir ce champ ' : null,
          onSaved: (input) => _email = input,
          style: TextStyle(
              fontSize: 18.0,
              height: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30.0,
            ),
            labelText: 'Username',
            border: UnderlineInputBorder(borderSide: BorderSide()),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        TextFormField(
          validator: (input) =>
              input.length < 6 ? 'Mot de passe trop court' : null,
          onSaved: (input) => _confirmation = input,
          style: TextStyle(
              fontSize: 18.0,
              height: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              labelText: 'Password',
              border: UnderlineInputBorder()),
          obscureText: true,
        ),
        TextFormField(
          validator: (input) => input.length < 6 ? 'Mot de passe trop court' : null,
          onSaved: (input) => _password = input,
          style: TextStyle(
              fontSize: 18.0,
              height: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              labelText: 'Confirmer le mot de passe',
              border: UnderlineInputBorder()),
          obscureText: true,
        ),
      ];
    } else {
      return [
        Image.asset(
          'assets/ballon.png',
          height: 162.0,
          width: 216.0,
        ),
        TextFormField(
          validator: (input) =>
              input.isEmpty ? 'Veuillez remplir ce champ ' : null,
          onSaved: (input) => _email = input,
          style: TextStyle(
              fontSize: 18.0,
              height: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30.0,
            ),
            labelText: 'Username',
            border: UnderlineInputBorder(borderSide: BorderSide()),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        TextFormField(
          validator: (input) =>
              input.length < 6 ? 'Mot de passe trop court' : null,
          onSaved: (input) => _password = input,
          style: TextStyle(
              fontSize: 18.0,
              height: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
                size: 30.0,
              ),
              labelText: 'Password',
              border: UnderlineInputBorder()),
          obscureText: true,
        ),
      ];
    }
  }
  // Inputs End

  // Buttons
  List<Widget> buildLoginButtons() {
    if (_formType == FormType.register) {
      return [
        Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.transparent,
                  onPressed: () => signup(context),
                  child: Text(
                    'Se Connecter',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white)),
                ),
                FlatButton(
                  onPressed: () => moveToLogin(),
                  child: Text(
                    'Déja inscris? Connectez vous !',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                )
              ],
            )),
      ];
    } else {
      return [
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 148.0,
                height: 52.0,
                child: RaisedButton(
                  color: Colors.transparent,
                  onPressed: () => login(context),
                  child: Text(
                    'Se Connecter',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue[900],
                      ))),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                      onPressed: () => null,
                      icon: Icon(FontAwesomeIcons.google, color: Colors.red))),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: () => moveToRegister(),
            child: Text(
              "S'inscrire",
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
        ),
      ];
    }
  }
}
