import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}


class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
          title: Text("Test"),
          centerTitle: false,
          elevation: 5.0,
        ),
        drawer: MainNavigationDrawer(),
      );
  }

}


