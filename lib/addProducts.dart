import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  File imageFile;

  String _productName;
  String _price;
  String _category;
  String _description;
  String _cost;

  var _cats = ['EDP', 'Air Freshener'];
  String _catsSelectedItem;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var controllerPrice = new MaskedTextController(mask: 'RM 00.00');
  var controllerCost = new MaskedTextController(mask: 'RM 00.00');

  Widget _buildProductName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Product name is required';
        }

        return null;
      },
      onSaved: (String value) {
        _productName = value;
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      controller: controllerPrice,
      decoration: InputDecoration(labelText: 'Price'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Price is required';
        }

        return null;
      },
      onSaved: (String value) {
        _price = value;
      },
    );
  }

  Widget _buildCategory() {
    return DropdownButton<String>(
      hint: Text('Please choose a category'),
      value: _catsSelectedItem,
      isExpanded: true,
      onChanged: (newSelectedItem) {
        setState(() {
          _catsSelectedItem = newSelectedItem;
        });
      },
      items: _cats.map((catsItem) {
        return DropdownMenuItem(
          value: catsItem,
          child: Text(catsItem),
        );
      }).toList(),
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }

        return null;
      },
      onSaved: (String value) {
        _productName = value;
      },
    );
  }

  Widget _buildCost() {
    return TextFormField(
      controller: controllerCost,
      decoration: InputDecoration(labelText: 'Cost'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Cost is required';
        }

        return null;
      },
      onSaved: (String value) {
        _cost = value;
      },
    );
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return  Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
        ),
        elevation: 10.0,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    "Please choose",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    child: Text(
                      "Gallery",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Divider(),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    child: Text(
                      "Camera",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return GFAvatar(
        radius: 100.0,
        backgroundImage: AssetImage('images/no-image.jpg'),
        shape: GFAvatarShape.standard,
        backgroundColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Text("Upload product image"),
        ),
      );
    } else {
      return GFAvatar(
        radius: 100.0,
        backgroundImage: FileImage(imageFile),
        shape: GFAvatarShape.standard,
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("New Products",
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _showChoiceDialog(context);
                  },
                  child: Container(
                    child:  _decideImageView(),
                  ),
                ),
                Divider(),
                _buildProductName(),
                SizedBox(height: 10.0,),
                _buildPrice(),
                SizedBox(height: 10.0,),
                _buildCategory(),
                SizedBox(height: 10.0,),
                _buildDescription(),
                SizedBox(height: 10.0,),
                _buildCost(),
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
          text: "Create Product",
          shape: GFButtonShape.pills,
          type: GFButtonType.outline2x,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
