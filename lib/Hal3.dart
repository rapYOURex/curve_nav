import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'main.dart';

class Hal3 extends StatefulWidget {
  @override
  _Hal3State createState() => _Hal3State();
}
class _Hal3State extends State<Hal3> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Scanner',
            style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Roboto',color: Colors.white)
        ),
        centerTitle: true,
      ),
      body: Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              onPressed: () => scanBarcodeNormal(),
              child: Text("Barcode Scan",
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold, fontFamily: 'Montserrat',color: Colors.green)
              )
          ),

          RaisedButton(
              onPressed: () => scanQR(),
              child: Text("QR Scan",
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold, fontFamily: 'Montserrat',color: Colors.green)
              )
          ),
          SizedBox(height: 10.0,),

          Text(
              'Scan result : $_scanBarcode\n',
            style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.bold, fontFamily: 'Montserrat',color: Colors.green),
          textAlign: TextAlign.center,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
      ),
    );
  }
}
