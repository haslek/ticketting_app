import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Widget scanner(MobileScannerController controller,Function onDetect){
  return MobileScanner(
    allowDuplicates: false,
    controller: controller,
    onDetect: (barcode,args){
      onDetect(barcode.rawValue);
    },
  );
}
Widget scannerD(Function onDetect){
  return MobileScanner(
    allowDuplicates: false,
    onDetect: (barcode,args){
      onDetect(barcode.rawValue);
    },
  );
}