import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage ({
    Key key,
    this.user
  }) :super(key:key);
  final FirebaseUser user;
  
  @override
  HomePageState createState() => HomePageState();
  }
  
class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body: new Center(
        child: new Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
      bottomNavigationBar:  BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () => {},),
            IconButton(icon: Icon(Icons.search), onPressed: () => {},),
            IconButton(icon: Icon(Icons.notifications), onPressed: () => {},),
            IconButton(icon: Icon(Icons.person), onPressed: () => {},),
          ],
        ),
      ) 
    );
  }
}