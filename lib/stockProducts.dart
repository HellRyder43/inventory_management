import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'constants.dart';

class StockProduct extends StatefulWidget {
  final String stockName;
  final int quantity;
  const StockProduct({this.stockName, this.quantity});

  @override
  _StockProductState createState() => _StockProductState();
}

class _StockProductState extends State<StockProduct> {

  String _stockQuantity;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildQuantity() {
    return TextFormField(
      initialValue: widget.quantity.toString(),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Quantity is required';
        }

        return null;
      },
      onSaved: (String value) {
        _stockQuantity = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(widget.stockName,
          style: TextStyle(
            color: Color(0xFF5D6673),
          ),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Color(0xFF62628D),),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("On Hand", style: kStockStyleLight,),
                _buildQuantity(),
                SizedBox(height: 30.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GFListTile(
                      color: Colors.greenAccent,
                      titleText: 'Stock Movement',
                      icon: FaIcon(FontAwesomeIcons.chevronRight),
                    ),
                    Divider(),
                    GFListTile(
                      color: Colors.greenAccent,
                      titleText: 'Minimum Stock : 5',
                      icon: FaIcon(FontAwesomeIcons.chevronRight),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GFButton(
          onPressed: (){
            if (!_formKey.currentState.validate()) {
              return;
            }

            _formKey.currentState.save();
          },
          text: "Update Stock",
          shape: GFButtonShape.pills,
          type: GFButtonType.outline2x,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
