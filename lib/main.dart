import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'constants.dart';
import 'bottomBar.dart';
import 'drawerItems.dart';
import 'customAppBar.dart';
import 'addProducts.dart';
import 'cartScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Dexandra Inventory",
  theme: ThemeData(
    brightness: Brightness.light,
  ),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int totalQuantity = 0;
  double totalPrice = 0.00;
  var itemType = [];

  String textOfButton = "No Items : RM 0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppBar(title: 'Checkout',),
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
                  Text("Search Products"),
                ],
              ),
              SizedBox(height: 15.0,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    totalQuantity = totalQuantity + 1;
                    totalPrice = totalPrice + 75.00;
                    itemType.add("EDP");

                    textOfButton = "$totalQuantity Items = RM " + totalPrice.toStringAsFixed(2);
                  });
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/Clubman.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Clubman',
                  icon: Text('RM 75.00'),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    totalQuantity = totalQuantity + 1;
                    totalPrice = totalPrice + 75.00;
                    itemType.add("EDP");

                    textOfButton = "$totalQuantity Items = RM " + totalPrice.toStringAsFixed(2);
                  });
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/Chaleur.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Chaleur',
                  icon: Text('RM 75.00'),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    totalQuantity = totalQuantity + 1;
                    totalPrice = totalPrice + 10.00;
                    itemType.add("AF");

                    textOfButton = "$totalQuantity Items = RM " + totalPrice.toStringAsFixed(2);
                  });
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/ForestDream.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Forest Dream',
                  icon: Text('RM 10.00'),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    totalQuantity = totalQuantity + 1;
                    totalPrice = totalPrice + 10.00;
                    itemType.add("AF");

                    textOfButton = "$totalQuantity Items = RM " + totalPrice.toStringAsFixed(2);
                  });
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/RoseForest.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Rose Forest',
                  icon: Text('RM 10.00'),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddProducts(),
                  ));
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/no-image.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Create Product',
                  icon: FaIcon(FontAwesomeIcons.plus, color: Colors.greenAccent,),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GFButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CartScreen(
                quantityItems: totalQuantity,
                itemPrice: totalPrice,
                itemType: itemType,
              ),
            ));
          },
          text: textOfButton,
          shape: GFButtonShape.pills,
          type: GFButtonType.outline2x,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
