import 'dart:async';

import 'package:flutter/cupertino.dart';

class AppStateManager extends ChangeNotifier{
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  set isInitialized(bool v){
    _isInitialized = v;
    notifyListeners();
  }
  bool _referenceValid = false;
  bool get referenceValid => _referenceValid;
  set referenceValid(bool v){
    _referenceValid = v;
    notifyListeners();
  }
  bool _pushToScan = false;
  bool get pushToScan => _pushToScan;
  set pushToScan(bool v){
    _pushToScan = v;
    notifyListeners();
  }
  String _ticketId = '';
  String get ticketId => _ticketId;
  set ticketId(String t){
    _ticketId = t;
    notifyListeners();
  }
  String _ticketType = '';
  String get ticketType => _ticketType;
  set ticketType(String t){
    _ticketType = t;
    notifyListeners();
  }
  String _phone = '';
  String get phone => _phone;
  set phone(String t){
    _phone = t;
    notifyListeners();
  }
  String _pin = '';
  String get pin => _pin;
  set pin(String t){
    _pin = t;
    notifyListeners();
  }
  int _numTickets = 0;
  int get numTickets => _numTickets;
  set numTickets(int n){
    _numTickets = n;
    notifyListeners();
  }
  int _numTicketsRedeemed = 0;
  int get numTicketsRedeemed => _numTicketsRedeemed;
  set numTicketsRedeemed(int n){
    _numTicketsRedeemed = n;
    notifyListeners();
  }

  // bool _pushToScan = false;
  // bool get pushToScan => _pushToScan;
  // set pushToScan(bool v){
  //   _pushToScan = v;
  //   notifyListeners();
  // }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool v){
    _loading = v;
    notifyListeners();
  }

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
          () {
        _isInitialized = true;
        notifyListeners();
      },
    );
  }
}