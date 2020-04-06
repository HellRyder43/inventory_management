library fancy_bottom_navigation;

import 'package:dexandrainventory/main.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'setting.dart';

class BottomBar extends StatefulWidget {
  BottomBar({@required this.tabSelection});

  final int tabSelection;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: Color(0xFFdeecff),
      textColor: Color(0xFF62628D),
      tabs: [
        TabData(iconData: FontAwesomeIcons.home, title: "Home"),
        TabData(iconData: FontAwesomeIcons.cog, title: "Settings"),
      ],
      initialSelection: widget.tabSelection,
      onTabChangedListener: (position) {
        setState(() {
          //currentPage = position;
          if (position == 1) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ));
          } else if (position == 0) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Home(),
            ));
          }
        });
      },
    );
  }
}

