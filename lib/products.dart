import 'package:dexandrainventory/stockProducts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getflutter/getflutter.dart';
import 'customAppBar.dart';
import 'drawerItems.dart';
import 'bottomBar.dart';
import 'addProducts.dart';
import 'categoryProducts.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List list = [
    "Air Freshener",
    "EDP",
    "Body Odour",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppBar(title: 'Items (4)',),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white
        ),
        child: MyDrawer(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GFTabs(
              tabBarColor: Colors.white,
              indicatorWeight: 3.0,
              initialIndex: 0,
              length: 3,
              labelColor: Color(0xFF2AD0AB),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF2AD0AB),
              tabBarHeight: 60.0,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Items",
                  ),
                ),
                Tab(
                  child: Text(
                    "Stock",
                  ),
                ),
                Tab(
                  child: Text(
                    "Category",
                  ),
                ),
              ],
              tabBarView: GFTabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        GFSearchBar(
                          searchBoxInputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(FontAwesomeIcons.search, color: Color(0xFF2AD0AB),),
                            ),
                            hintText: 'Search products',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                          ),
                          searchList: list,
                          hideSearchBoxWhenItemSelected: false,
                          overlaySearchListHeight: 100.0,
                          searchQueryBuilder: (query, list) {
                            return list
                                .where((item) =>
                                item.toLowerCase().contains(query.toLowerCase()))
                                .toList();
                          },
                          overlaySearchListItemBuilder: (item) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                          noItemsFoundWidget: Container(
                            color: Colors.greenAccent,
                            child: Text("No items found"),
                          ),
                          onItemSelected: (item) {
                            setState(() {
                              print('$item');
                            });
                          },
                        ),
                        Column(
                          children: <Widget>[
                            GFListTile(
                              avatar:GFAvatar(
                                shape: GFAvatarShape.standard,
                                backgroundImage: AssetImage('images/Clubman.jpeg'),
                                backgroundColor: Colors.transparent,
                              ),
                              titleText:'Clubman',
                              subtitleText:'EDP',
                              icon: Text('RM 75.00'),
                            ),
                            Divider(),
                            GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/Chaleur.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Chaleur',
                                subtitleText:'EDP',
                                icon: Text('RM 75.00'),
                            ),
                            Divider(),
                            GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/ForestDream.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Forest Dream',
                                subtitleText:'Air Freshener',
                                icon: Text('RM 10.00'),
                            ),
                            Divider(),
                            GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/RoseForest.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Rose Forest',
                                subtitleText:'Air Freshener',
                                icon: Text('RM 10.00'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                child: FaIcon(FontAwesomeIcons.plus),
                                backgroundColor: Colors.greenAccent,
                                foregroundColor: Colors.white,
                                splashColor: Colors.black,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => AddProducts(),
                                  ));
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        GFSearchBar(
                          searchBoxInputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FaIcon(FontAwesomeIcons.search, color: Color(0xFF2AD0AB),),
                              ),
                              hintText: 'Search products',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                          ),
                          searchList: list,
                          hideSearchBoxWhenItemSelected: false,
                          overlaySearchListHeight: 100.0,
                          searchQueryBuilder: (query, list) {
                            return list
                                .where((item) =>
                                item.toLowerCase().contains(query.toLowerCase()))
                                .toList();
                          },
                          overlaySearchListItemBuilder: (item) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                          noItemsFoundWidget: Container(
                            color: Colors.greenAccent,
                            child: Text("No items found"),
                          ),
                          onItemSelected: (item) {
                            setState(() {
                              print('$item');
                            });
                          },
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => StockProduct(stockName: "Clubman", quantity: 12,),
                                ));
                              },
                              child: GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/Clubman.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Clubman',
                                subtitleText:'EDP',
                                icon: Text('12'),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => StockProduct(stockName: "Chaleur", quantity: 10,),
                                ));
                              },
                              child: GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/Chaleur.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Chaleur',
                                subtitleText:'EDP',
                                icon: Text('10'),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => StockProduct(stockName: "Forest Dream", quantity: 25,),
                                ));
                              },
                              child: GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/ForestDream.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Forest Dream',
                                subtitleText:'Air Freshener',
                                icon: Text('25'),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => StockProduct(stockName: "Rose Forest", quantity: 30,),
                                ));
                              },
                              child: GFListTile(
                                avatar:GFAvatar(
                                  shape: GFAvatarShape.standard,
                                  backgroundImage: AssetImage('images/RoseForest.jpeg'),
                                  backgroundColor: Colors.transparent,
                                ),
                                titleText:'Rose Forest',
                                subtitleText:'Air Freshener',
                                icon: Text('30'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                child: FaIcon(FontAwesomeIcons.filter),
                                backgroundColor: Colors.greenAccent,
                                foregroundColor: Colors.white,
                                splashColor: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        GFSearchBar(
                          searchBoxInputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FaIcon(FontAwesomeIcons.search, color: Color(0xFF2AD0AB),),
                              ),
                              hintText: 'Search category',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                          ),
                          searchList: list,
                          hideSearchBoxWhenItemSelected: false,
                          overlaySearchListHeight: 100.0,
                          searchQueryBuilder: (query, list) {
                            return list
                                .where((item) =>
                                item.toLowerCase().contains(query.toLowerCase()))
                                .toList();
                          },
                          overlaySearchListItemBuilder: (item) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                          noItemsFoundWidget: Container(
                            color: Colors.greenAccent,
                            child: Text("No items found"),
                          ),
                          onItemSelected: (item) {
                            setState(() {
                              print('$item');
                            });
                          },
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CategoryProducts(title: "Edit Category",),
                                ));
                              },
                              child: GFListTile(
                                subtitleText:'EDP',
                                icon: FaIcon(FontAwesomeIcons.edit),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CategoryProducts(title: "Edit Category",),
                                ));
                              },
                              child: GFListTile(
                                subtitleText:'Air Freshener',
                                icon: FaIcon(FontAwesomeIcons.edit),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                child: FaIcon(FontAwesomeIcons.plus),
                                backgroundColor: Colors.greenAccent,
                                foregroundColor: Colors.white,
                                splashColor: Colors.black,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CategoryProducts(title: "New Category",),
                                  ));
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
