import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //  Background color
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        //  AppBar
        appBar: AppBar(
          backgroundColor: Color(0xFF003764),
          actions: <Widget>[
            IconButton(
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          ],
        ),
        endDrawer: Drawer(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF003764),
                          const Color(0xFF005B7F),
                          const Color(0xFF003764)
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 0.5, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  accountName: Text("Ashish Rawat"),
                  accountEmail: Text("ashishrawat2911@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color(0xFF003764),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //  Body
        body: Container(
            decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF003764),
                const Color(0xFF005B7F),
                const Color(0xFF003764)
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp),
        )),
        // Body End ------------

        // Floating Button section
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF003764),
          onPressed: () {},
          tooltip: 'Increment',
          child: Text('Jouer'),
          elevation: 2.0,
        ),

        // --------------------------

        //  Bottom Appbar
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          color: Color(0xFF003764),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        )
        //  End bottom appbar -------
        );
  }
}
