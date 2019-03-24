import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  
  @override
  _SignupPageState createState() => _SignupPageState();
  }
  
  class _SignupPageState extends State<Signup> {
    String _email, _password,_confirmation, _name, _surname, _username;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    void signup(BuildContext context) => null;

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding : false,
			body: new Container(
         decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new SafeArea(
          minimum: EdgeInsets.only(top: 100.0),
          child: Center(
            child: Container(
              child: new ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        new TextFormField(
                          validator: (input) => input.isEmpty ?  'Please type name' : null,
                          onSaved: (input) => _name = input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.account_circle, color: Colors.white, size: 30.0,),
                            labelText: 'Nom',
                            border: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0,),
                        new TextFormField(
                          validator: (input) => input.isEmpty ?  'Please type prenom' : input,
                          onSaved: (input) => _surname =input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.account_circle, color: Colors.white, size: 30.0,),
                            labelText: 'Prenom',
                            border: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                
                              )
                            ),
                          ),
                        ),
                        new TextFormField(
                          validator: (input) => input.isEmpty ?  'Please type email' : input,
                          onSaved: (input) => _email = input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.account_circle, color: Colors.white, size: 30.0,),
                            labelText: 'Email',
                            border: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0,),
                        new TextFormField(
                          validator: (input) => input.isEmpty ?  'Please type username' : input,
                          onSaved: (input) => _username = input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.account_circle, color: Colors.white, size: 30.0,),
                            labelText: "Nom d'utilisateur",
                            border: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0,),
                        new TextFormField(
                          validator: (input) => input.isEmpty ?  'Please type password' : input.length < 6 ? 'Le mot de passe est trop court' : input,
                          onSaved: (input) => _password = input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.lock, color: Colors.white, size: 30.0,),
                            labelText: 'Mot de passe',
                            border: new UnderlineInputBorder()
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 12.0,),
                        new TextFormField(
                          validator: (input) => input != _password ? 'Les mots de passes ne sont pas identiques'  :input,
                          onSaved: (input) => _confirmation = input,
                          style: new TextStyle(
                            fontSize: 18.0,
                            height: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white   
                          ),
                          decoration: new InputDecoration(
                            icon: Icon(Icons.lock, color: Colors.white, size: 30.0,),
                            labelText: 'Confirmer le Mot de passe',
                            border: new UnderlineInputBorder()
                          ),
                          obscureText: true,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50.0),
                          child:  ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 148.0,
                                height: 52.0,
                                child: RaisedButton(
                                  color: Colors.transparent,
                                  onPressed: () => signup(context) ,
                                  child: Text("S'inscrire",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                      color: Colors.white
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
		);
  }
}