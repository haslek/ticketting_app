import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ticketting_app/components/components.dart';

import '../pages.dart';
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.scanPath,
      key: ValueKey(AppPages.scanPath),
      child: const ScanScreen(),
    );
  }
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;
  // late MobileScannerController mobileController;
  bool codeDetected = false;
  bool startScan = false;
  String? scannedCode;
  Widget scannerWidget = const SizedBox();
  int numScan = 0;

  void startScanning(){
    setState(() {
      // mobileController = MobileScannerController();
      // scannerWidget = scanner(mobileController, onDetect);
      scannerWidget = scannerD(onDetect);
      startScan = true;
    });
  }
  void stopScanning(){
    setState(() {
      startScan = false;
      // mobileController.dispose();
    });
  }
  void onDetect(String? code){
    setState(() {
      codeDetected = code==null;
      if(numScan > 0){
        scannedCode = scannedCode! + ' ' + code!;
      }else{
        scannedCode = code;
      }
      numScan++;
      startScan = false;
      // mobileController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Expanded(
            flex: 3,
              child: Center(
                child: Text(
                  'Place the camera over the qr code to scan',
                ),
              )
          ),
          startScan ? SizedBox(
            height: 200,
            width: 200,
            child: scannerWidget,
          ): ElevatedButton(onPressed: startScanning, child: const Text(
            'Start Scan'
          )),
          !startScan ? const SizedBox() : ElevatedButton(onPressed: stopScanning, child: const Text(
              'Stop Scan'
          )),
          Expanded(
            flex: 4,
            child: Center(
              child: (scannedCode != null)
                  ? Text(
                  'Barcode found: $scannedCode')
                  : const Text('Code not found or scanning not performed yet'),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // mobileController.dispose();
    super.dispose();
  }
}
