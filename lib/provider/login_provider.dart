import 'package:flutter/material.dart';

class LoginScreenProvider with ChangeNotifier{
  bool? ischecked;
  String? message = "";

  void checked (bool checked){
    if(checked != true){
      message = "Please click on checkbox";
      notifyListeners();
    }else{
      message  = "";
      notifyListeners();
    }
  }
}

class RegisterScreenProvider with ChangeNotifier{
  bool? ischecked;
  String? message = "";

  void checked (bool checked){
    if(checked != true){
      message = "Please click on checkbox";
      notifyListeners();
    }else{
      message  = "";
      notifyListeners();
    }
  }
}
