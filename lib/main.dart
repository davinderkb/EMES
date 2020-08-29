import 'dart:ui';

import 'package:emes/homepage.dart';
import 'package:emes/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'login.dart';

void main() => runApp(MainActivity());

class MainActivity extends StatefulWidget {

  @override
  MainActivityState createState() {
    return MainActivityState();
  }

}


class MainActivityState extends State<MainActivity>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMES',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class MainNavigationDrawer extends StatefulWidget {
  const MainNavigationDrawer({Key key,}) : super(key: key);


  @override
  MainNavigationDrawerState createState() {
    return MainNavigationDrawerState();
  }
}

class MainNavigationDrawerState extends State<MainNavigationDrawer>{
  dynamic user;

  TextStyle drawerTileText = TextStyle(fontSize: 15);
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final iconSize = 24.0;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Container(
        width: _width/1.8,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.white,

        ),
        child: new Drawer(
          child: ListTileTheme(
            textColor: Colors.black87,
            iconColor:  Colors.black87,
            dense:true,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: _height>_width? _height/4.5: _width/4.5,
                      color: Colors.blue ,
                      child: Column(
                        children: <Widget>[
                          Container(height:_height>_width? _height/8:_width/8, color:Colors.blue),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: _height>_width?_height/22 : _width/22),
                              Text("Alan Seelinger",style: TextStyle(color:Colors.white,fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),

                        ],



                      ),
                    ),
                    Positioned(
                      width: _width/1.8,
                      top: _height>_width? _width * 0.14 : _height *0.14 ,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                                height: 60,
                                width: 60,
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(300.0),
                                  child: FadeInImage.assetNetwork(
                                      placeholder: "assets/images/ic_profile.png",
                                      image: "",
                                      fit: BoxFit.fill),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 0.0,
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),

                    )
                  ],
                ),
                SizedBox(height: _height/18,),
                ListTile(
                  title: Text(Constants.ROSTER, style: drawerTileText,),
                  leading: Icon(Icons.assignment),
                  onTap: () async {
                    Navigator.pop(context,true);
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(Constants.PROFILE, style: drawerTileText),
                  leading: Icon(Icons.person),
                  onTap: () async {
                    Navigator.pop(context,true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(Constants.APPLY_LEAVE, style: drawerTileText),
                  leading: Icon(Icons.today),
                  onTap: () async {
                    Navigator.pop(context,true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(Constants.INBOX, style: drawerTileText),
                  leading: Icon(Icons.chat),
                  onTap: () async {
                    Navigator.pop(context,true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(Constants.LOGOUT, style: drawerTileText),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () async {
                    Navigator.pop(context,true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }

}
