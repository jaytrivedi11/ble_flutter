import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimatum/JoyStick.dart';
import 'package:ultimatum/url_screen.dart';
import 'bluetooth.dart';


class tabview extends StatefulWidget {


  @override
  State<tabview> createState() => _tabviewState();
}

class _tabviewState extends State<tabview> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        title: Text("Ultimatum"),
        bottom: const TabBar(
          tabs: [
            Tab(
              text: "URL_1",
            ),
            Tab(
              text: "JOYSTICK",
            ),
            Tab(
              text: "BLE",
            ),
            Tab(
              text: "GPS",
            ),
          ],
        ),
      ),
      body:  TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: url_screen(),
          ),
          Center(
            child: JoyStick(radius: 100.0, stickRadius: 20 ),
          ),
          Center(
            child: bluetooth(),
          ),
          Center(
            child: Icon(Icons.call),
          )
        ],
      ),
    ));
  }
}


