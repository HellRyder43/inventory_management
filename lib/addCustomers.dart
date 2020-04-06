import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getflutter/getflutter.dart';
import 'dart:io';

class AddCustomers extends StatefulWidget {
  @override
  _AddCustomersState createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {

  File imageFile;

  String _customerName;
  String _mobileNo;
  String _addressLine1;
  String _addressLine2;
  String _email;
  String _notes;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCustomerName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Customer Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Customer name is required';
        }

        return null;
      },
      onSaved: (String value) {
        _customerName = value;
      },
    );
  }

  Widget _buildMobileNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Mobile No'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mobile no is required';
        }

        return null;
      },
      onSaved: (String value) {
        _mobileNo = value;
      },
    );
  }

  Widget _buildAddressLine1() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address Line 1'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address line 1 is required';
        }

        return null;
      },
      onSaved: (String value) {
        _addressLine1 = value;
      },
    );
  }

  Widget _buildAddressLine2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address Line 2'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address line 2 is required';
        }

        return null;
      },
      onSaved: (String value) {
        _addressLine2 = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildNotes() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Notes'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Notes is required';
        }

        return null;
      },
      onSaved: (String value) {
        _notes = value;
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
          child: Text("Upload Picture"),
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
        title: Text("New Customer",
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
                    child: _decideImageView(),
                  ),
                ),
                Divider(),
                _buildCustomerName(),
                _buildMobileNo(),
                _buildAddressLine1(),
                _buildAddressLine2(),
                _buildEmail(),
                _buildNotes()
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
