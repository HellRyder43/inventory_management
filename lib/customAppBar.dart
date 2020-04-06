import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {

  CustomAppBar({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5.0,
      automaticallyImplyLeading: false,
      title: Text(title,
        style: TextStyle(
          color: Color(0xFF5D6673),
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: FaIcon(FontAwesomeIcons.bars, color: Color(0xFF5D6673),),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: FaIcon(FontAwesomeIcons.bell, color: Color(0xFF4AD7B7),),
          onPressed: () {},
        )
      ],
    );
  }
}
