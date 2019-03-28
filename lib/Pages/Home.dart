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

  int _currentTab = 0;

  Widget _home = Text('Acceuil');
  Widget _search = Text('seach');
  Widget _notifications = Text('Notifications');
  Widget _messages = Text('messages');
  Widget _body = Text('Acceuil');


  List _bottomItems = [
    {"icon": Icons.home, "index": 0},
    {"icon": Icons.search, "index": 1},
    {"icon": Icons.notifications, "index": 2},
    {"icon": Icons.chat, "index": 3},
  ];

  void setBody(Widget widget) {
    setState(() {
      _body = widget;
    });
  }

  @override
  void initState() {
    super.initState();

    changeTab(index: 0);
  }

  // On tap handling ( Bottom app bar... navigation ect)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF256741),
        key: _scaffoldKey,
        
        appBar: _body ==_home || _body ==_notifications ? buildAppBar() : null,

        endDrawer: _body ==_home ? buildDrawer() : null,

        body: buildBody(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => {},
          tooltip: 'Increment',
          child: Text(
            'Jouer',
            style: TextStyle(
              color: Color(0xFF256741),
              fontSize: 16.0
            ),
          ),
          elevation: 2.0,
        ),

        bottomNavigationBar: _buildBottomNavigation(context)
    );
  }

// --------------------------------------------------------------------------------------------------
  // Refractoring Part
// --------------------------------------------------------------------------------------------------
  //  Change tab function for bottom navigation bar
  void changeTab({index = 0}) {
    switch (index) {
      case 0:
        setBody(_home);
        break;
      case 1:
        setBody(_search);
        break;
      case 2:
        setBody(_notifications);
        break;
      case 3:
        setBody(_messages);
        break;
    }
  }

//  Drawer
  Drawer buildDrawer() {
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                color: Color(0xFF256741),
              ),
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: _body == _home ? _home :_body ==_notifications ? _notifications : null,
      centerTitle: true,
      backgroundColor: Color(0xFF256741),
      elevation: 0.0,
      actions: _body == _home ? <Widget>[
        IconButton(
          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        )
      ] : null,
    );
  }

  // Bottom navigation Bar with FAB center docked
  _buildBottomNavigation(BuildContext context) {
    var _items = <BottomNavigationBarItem>[];

    for (var item in _bottomItems) {
      _items.add(new BottomNavigationBarItem(
        icon: new Icon(
          item['icon'],
          color: Colors.black,
        ),
        title: new Text(''),
      ));
    }

    return new BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _bottomItems.map((x) {
          return new IconButton(
            icon: new Icon(
              x['icon'],
              color: _currentTab == x['index'] ? Color(0xFF256741) : Colors.black38,
            ),
            onPressed: () {
              setState(() {
                _currentTab = x['index'];
              });
              changeTab(index: x['index']);
            },
          );
        }).toList(),
      ),
    );
  }

  // Body
  Widget buildBody() {
    return Center(child : _buildCarousel(context));
  }

  
  Widget _buildCarousel(BuildContext context) {
    return 
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 300.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex);
            },
          ),
        );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          boxShadow: [
            BoxShadow(
              offset: new Offset(5.0, 0.0),
              blurRadius: 5.0,
            ),
          ]
        ),
      ),
    );
  }
}
