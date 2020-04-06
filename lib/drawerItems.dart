import 'package:dexandrainventory/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:getflutter/getflutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'products.dart';
import 'setting.dart';
import 'customers.dart';
import 'transactions.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF444C5F)
      ),
      child: GFDrawer(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.green,
                    Colors.greenAccent
                  ],
                )
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 45.0,
                      backgroundImage: NetworkImage(
                          'https://nyppagesix.files.wordpress.com/2019/06/chris-hemsworth.jpg?quality=90&strip=all&w=1236&h=820&crop=1'),
                    ),
                    SizedBox(height: 10.0,),
                    Text('Luqman', style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10.0,),
                    Text('luqman10993@gmail.com', style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 12.0,
                    ),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.checkCircle),
              title: Text("Checkout", style: kSideBarMenuStyleBold,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.boxes),
              title: Text("Products", style: kSideBarMenuStyleBold,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Products(),
                ));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.store),
              title: Text("Customers", style: kSideBarMenuStyleBold,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Customers(),
                ));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.coins),
              title: Text("Transactions", style: kSideBarMenuStyleBold,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Transactions(),
                ));
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cog),
              title: Text("Settings", style: kSideBarMenuStyleBold,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ));
              },
            ),
          ],
        ),
      )
    );
  }
}



