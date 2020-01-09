import 'package:flutter/material.dart';

class FormBloc with ChangeNotifier {



  String _firstNames = "";
  getFirstName() => _firstNames;
  setFirstName(String firstNames) => _firstNames = firstNames;

  String _lastNames = "";
  getLastName() => _lastNames;
  setLastName(String firstNames) => _lastNames = firstNames;

  String _email = "";
  getemail() => _email;
  setemail(String firstNames) => _email = firstNames;
  void changeTextFirstName(value){
    _firstNames = value;
    notifyListeners();
  }

  void changeTextLastName(value){

    _lastNames = value;

    notifyListeners();
  }

  void changeTextEmail(value){

    _email = value;

    notifyListeners();
  }
}
