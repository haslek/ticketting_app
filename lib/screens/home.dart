import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketting_app/providers/app_state_manager.dart';

import '../pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.home,
      key: ValueKey(AppPages.home),
      child: const Home(),
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  void _submitForm(){
    if(_formKey.currentState!.validate()){
      // Provider.of<AppStateManager>(context,listen: false).loading = true;
      showDialog(
        useRootNavigator: false,
          context: context,
          builder: (context)=>const Dialog(
            child:  SizedBox(
              height: 100,
              width: 100,
              child:  Padding(
                padding: EdgeInsets.all(18.0),
                child: SizedBox(
                  height: 40,
                    width: 40,
                    child: CircularProgressIndicator(color: Colors.green,)),
              ),
            ),
          )
      );
      Future.delayed(const Duration(milliseconds: 1500),(){
        Navigator.pop(context);
        Provider.of<AppStateManager>(context,listen: false).referenceValid = true;
        Provider.of<AppStateManager>(context,listen: false).pushToScan = true;
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          validator: (val){
                            if(val == null || val.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Phone'
                          ),
                          controller: _phController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          validator: (val){
                            if(val == null || val.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Reference'
                          ),
                          controller: _refController,
                        ),
                      ),
                      ElevatedButton(onPressed: _submitForm,
                          child: const Text('Submit'))
                    ],
            ),
                ))
          ],
        ),
      ),
    );
  }
}
