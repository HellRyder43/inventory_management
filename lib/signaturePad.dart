import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:getflutter/getflutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

const directoryName = 'Signature';

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {

  ByteData _img = ByteData(0);
  var color = Colors.black;
  var strokeWidth = 5.0;
  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Signature", style: TextStyle(
          color: Color(0xFF5D6673),
        ),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Color(0xFF62628D),),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Signature(
                  color: color,
                  key: _sign,
                  onSign: () {
                    final sign = _sign.currentState;
                    debugPrint('${sign.points.length} points in the signature');
                  },
                  strokeWidth: strokeWidth,
                ),
              ),
              color: Colors.black12,
            ),
          ),
          _img.buffer.lengthInBytes == 0 ?
          Container() :
          LimitedBox(
              maxHeight: 200.0,
              child: Image.memory(_img.buffer.asUint8List()
              )
          ),
          Container(
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GFButton(
                      onPressed: () async {
                        final sign = _sign.currentState;
                        //retrieve image data, do whatever you want with it (send to server, save locally...)
                        final image = await sign.getData();
                        var data = await image.toByteData(format: ui.ImageByteFormat.png);

                        sign.clear();
                        final encoded = base64.encode(data.buffer.asUint8List());

                        //final directory = (await getApplicationDocumentsDirectory()).path;
                        //File imgFile = File('$directory/screenshot_${formattedDate()}.png');
                        setState(() {
                          _img = data;
                        });
                        debugPrint("onPressed " + encoded);
                        await askPermission();
                        Directory directory = await getExternalStorageDirectory();
                        String path = directory.path;
                        print("path image " + path);
                        await Directory('$path/$directoryName').create(recursive: true);
                        File('$path/$directoryName/${formattedDate()}.png')
                            .writeAsBytesSync(data.buffer.asInt8List());
                        //saveFile(file: imgFile);
                      },
                      text: "Save",
                      shape: GFButtonShape.pills,
                      type: GFButtonType.solid,
                      size: GFSize.LARGE,
                      color: Color(0xFF2AD0AB),
                    ),
                    GFButton(
                      onPressed: (){
                        final sign = _sign.currentState;
                        sign.clear();
                        setState(() {
                          _img = ByteData(0);
                        });
                        debugPrint("cleared");
                      },
                      text: "Clear",
                      shape: GFButtonShape.pills,
                      type: GFButtonType.solid,
                      size: GFSize.LARGE,
                      color: Color(0xFF2AD0AB),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String formattedDate() {
    DateTime dateTime = DateTime.now();
    String dateTimeString = 'Signature_' +
        dateTime.year.toString() +
        dateTime.month.toString() +
        dateTime.day.toString() +
        dateTime.hour.toString() +
        ':' + dateTime.minute.toString() +
        ':' + dateTime.second.toString();
    return dateTimeString;
  }

  saveFile({File file}) async {
    await askPermission();
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(await file.readAsBytes())
    );
    print(result);
  }

  askPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.photos]);
  }
}
