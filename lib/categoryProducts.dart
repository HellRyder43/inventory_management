import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class CategoryProducts extends StatefulWidget {
  final String title;
  CategoryProducts({this.title});

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  String _categoryName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCategory() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: 'Category Name?',
        labelText: 'Name',
      ),
      onSaved: (String value) {
        _categoryName = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(widget.title.toString(),
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
                _buildCategory(),
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
          text: "Save",
          shape: GFButtonShape.pills,
          type: GFButtonType.outline2x,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
