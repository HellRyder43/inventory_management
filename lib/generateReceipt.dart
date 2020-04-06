import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'receiptAppBar.dart';

class GenerateReceipt extends StatefulWidget {

  final String path;

  GenerateReceipt({this.path});

  @override
  _GenerateReceiptState createState() => _GenerateReceiptState();
}

class _GenerateReceiptState extends State<GenerateReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFViewerScaffold(
        path: widget.path,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: ReceiptAppBar(title: 'Receipt',),
        ),
      ),
    );
  }
}
