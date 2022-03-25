import 'package:flutter/material.dart';

import '../pages.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.scanPath,
      key: ValueKey(AppPages.scanPath),
      child: const SuccessScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child:  Center(
              child: Text('Successful'),
            ),
          ),
          RichText(text: const TextSpan(
            text: 'All ticket attached to this payment has been redeemed'
          ))
        ],
      ),
    );
  }
}
