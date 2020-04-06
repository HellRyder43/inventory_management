import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'preSignature.dart';

class CartScreen extends StatefulWidget {

  final int quantityItems;
  final double itemPrice;
  var itemType = [];

  CartScreen({this.quantityItems, this.itemPrice, this.itemType});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Cart Items", style: TextStyle(
          color: Color(0xFF5D6673),
        ),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Color(0xFF62628D),),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text(widget.quantityItems.toString() + "x " + widget.itemType[0]),
                trailing: Text("RM " + widget.itemPrice.toStringAsFixed(2)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("TOTAL: MYR " + widget.itemPrice.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GFButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => PreSignature(),
            ));
          },
          text: "Checkout",
          shape: GFButtonShape.pills,
          type: GFButtonType.solid,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
