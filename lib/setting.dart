import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'bottomBar.dart';
import 'drawerItems.dart';
import 'customAppBar.dart';
import 'constants.dart';
import 'businessInfo.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppBar(title: 'Settings',),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: FaIcon(FontAwesomeIcons.cogs),
                title: Text('General', style: kSettingsStyleBold),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: FaIcon(FontAwesomeIcons.storeAlt),
                title: Text('Business Information', style: kSettingsStyleBold,),
                subtitle: Text('Add information to your business'),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BusinessInfo(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
