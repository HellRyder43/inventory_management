import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'signaturePad.dart';
import 'generateReceipt.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PreSignature extends StatefulWidget {
  @override
  _PreSignatureState createState() => _PreSignatureState();
}

class _PreSignatureState extends State<PreSignature> {

  ByteData _img = ByteData(0);
  String path = '/storage/emulated/0/Android/data/com.example.dexandrainventory/files/Signature_202032820:51:25.png';
  //var data = await path.toByteData(format: ui.ImageByteFormat.png);

  final pdf = pw.Document();
  final pdf2 = pw.Document(deflate: zlib.encode);

  Future savePdf() async {
    Directory documentDir = await getApplicationDocumentsDirectory();

    String docPath = documentDir.path;

    File file = File("$docPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  writeOnPdf() async {

    const imageProvider = const AssetImage('images/sig1.png');
    const imageProvider2 = const AssetImage('images/sig2.png');

    final PdfImage sig1 = await pdfImageFromImageProvider(pdf: pdf.document, image: imageProvider);
    final PdfImage sig2 = await pdfImageFromImageProvider(pdf: pdf.document, image: imageProvider2);

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Dexandra Inventory", style: pw.TextStyle(fontSize: 28.0)),
                pw.Text("RECEIPT#1", style: pw.TextStyle(fontSize: 28.0))
              ]
            ),
            pw.SizedBox(
              height: 30.0
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text("Luqman +60186661360", style: pw.TextStyle(fontSize: 18.0)),
              ]
            ),
            pw.SizedBox(
                height: 30.0
            ),
            pw.Header(
              level: 0,
              child: pw.Text("1 Item (Qty:2)", style: pw.TextStyle(fontSize: 22.0))
            ),
            pw.SizedBox(
                height: 30.0
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Text("2x", style: pw.TextStyle(fontSize: 16.0)),
                pw.Text("Air Feshener", style: pw.TextStyle(fontSize: 16.0)),
                pw.Text("RM 10.00", style: pw.TextStyle(fontSize: 16.0, color: PdfColors.grey)),
                pw.SizedBox(width: 40.0),
                pw.Text("RM 20.00", style: pw.TextStyle(fontSize: 16.0, fontBold: pw.Font.courierBold())),
              ]
            ),
            pw.SizedBox(
                height: 40.0
            ),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    children: [
                      pw.Text("Total: RM 20.00", style: pw.TextStyle(fontSize: 20.0, fontBold: pw.Font.courierBold())),
                      pw.SizedBox(
                          height: 15.0
                      ),
                      pw.Text("Cash: RM 20.00", style: pw.TextStyle(fontSize: 16.0)),
                    ]
                  ),
                ]
            ),
            pw.Header(
                level: 0,
                child: pw.Text("")
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text("March 30, 2020 4:41 PM", style: pw.TextStyle(fontSize: 16.0, color: PdfColors.grey)),
              ]
            ),
            pw.Column(
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Container(
                        width: 200,
                        height: 200,
                        child: pw.Image(sig1),
                      ),
                      pw.Container(
                        width: 200,
                        height: 200,
                        child: pw.Image(sig2),
                      )
                    ]
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Text("Buyer's Signature"),
                      pw.Text("Seller's Signature"),
                    ]
                ),
              ]
            )
          ]
        ); // Center
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Choose Signature", style: TextStyle(
          color: Color(0xFF5D6673),
        ),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Color(0xFF62628D),),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SignaturePad(),
                  ));
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/sig1.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Customer\'s Signature',
                  icon: FaIcon(FontAwesomeIcons.chevronRight, color: Colors.greenAccent,),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SignaturePad(),
                  ));
                },
                child: GFListTile(
                  avatar:GFAvatar(
                    shape: GFAvatarShape.standard,
                    backgroundImage: AssetImage('images/sig2.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  titleText:'Seller\'s Singnature',
                  icon: FaIcon(FontAwesomeIcons.chevronRight, color: Colors.greenAccent,),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GFButton(
          onPressed: () async{
            await writeOnPdf();

            await savePdf();

            Directory documentDir = await getApplicationDocumentsDirectory();

            String docPath = documentDir.path;

            String fulPath = "$docPath/example.pdf";

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => GenerateReceipt(path: fulPath,),
            ));
          },
          text: "Get Receipt",
          shape: GFButtonShape.pills,
          type: GFButtonType.solid,
          size: GFSize.LARGE,
          color: Color(0xFF2AD0AB),
        ),
      ),
    );
  }
}
