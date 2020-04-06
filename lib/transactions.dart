import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'customAppBar.dart';
import 'drawerItems.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  List _elements = [
    {'name': 'Abu', 'group': '23 March 2020', 'price':'RM 14.00'},
    {'name': 'Ali', 'group': '23 March 2020', 'price':'RM 75.00'},
    {'name': 'Bob', 'group': '27 March 2020', 'price':'RM 75.00'},
    {'name': 'Abu', 'group': '20 March 2020', 'price':'RM 14.00'},
    {'name': 'Bob', 'group': '20 March 2020', 'price':'RM 07.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppBar(title: 'Transactions',),
      ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white
          ),
          child: MyDrawer(),
        ),
      body: GroupedListView<dynamic, String>(
              groupBy: (element) => element['group'],
              elements: _elements,
              order: GroupedListOrder.ASC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                child: Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: FaIcon(FontAwesomeIcons.dollarSign),
                title: Text(element['name']),
                subtitle: Text(element['price']),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GFButton(
          onPressed: (){},
          text: "Sales Total RM 185.00",
          shape: GFButtonShape.pills,
          type: GFButtonType.solid,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
