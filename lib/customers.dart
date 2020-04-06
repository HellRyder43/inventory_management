import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'customAppBar.dart';
import 'drawerItems.dart';
import 'addCustomers.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppBar(title: 'Customers (2)',),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white
        ),
        child: MyDrawer(),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.search, color: Colors.greenAccent,),
                  SizedBox(width: 15.0,),
                  Text("Search Customers"),
                ],
              ),
              SizedBox(height: 15.0,),
              GFListTile(
                titleText:'Abu',
                subtitleText: '3 Sales',
                icon: FaIcon(FontAwesomeIcons.chevronRight),
              ),
              Divider(),
              GFListTile(
                titleText:'Ali',
                subtitleText: '2 Sales',
                icon: FaIcon(FontAwesomeIcons.chevronRight),
              ),
              Divider(),
              GFListTile(
                titleText:'Bob',
                subtitleText: '2 Sales',
                icon: FaIcon(FontAwesomeIcons.chevronRight),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddCustomers()
            ));
        },
      ),
    );
  }
}
