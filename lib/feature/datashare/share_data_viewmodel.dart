import 'package:flutter/material.dart';

class HYCounterViewModel with ChangeNotifier {
  int _counter = 0;

  User _user = User();

  User get user => _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

}



class User with ChangeNotifier {
  String username;
  int age;


//
//  String get username => _username;
//
//  set username(String value) {
//    _username = value;
//    notifyListeners();
//  }
//
//  int get age => _age;
//
//  set age(int value) {
//    _age = value;
//    notifyListeners();
//  }
}

