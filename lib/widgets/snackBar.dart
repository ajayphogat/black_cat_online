import 'package:black_cat_online/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/my_shared_preference.dart';

//TODO: Top SnackBar
showError({
  String title = "",
  String description = "",
  SnackPosition position = SnackPosition.TOP,
}){
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    backgroundColor: Colors.blueAccent,
    snackPosition: position,
    barBlur: 0,
  );
}

//TODO: Bottom SnackBar
showSnackBar({
  String title = "",
  String description = "",
  int durationSec =  2,
}){
  Get.showSnackbar(GetSnackBar(title: title,message: description,duration: Duration(seconds: durationSec)));
}



//TODO: logout card
showLoginWidget({
  String description = "",
  int durationSec =  2,
}){
  Get.defaultDialog(title: "Session Expired",
      content:  Text(description),

      actions: [

        SizedBox(height: 10,),
        ElevatedButton(onPressed: () {
          MySharedPreferences.localStorage?.remove(MySharedPreferences.isLogin);
          MySharedPreferences.localStorage?.remove(MySharedPreferences.adminToken);
          MySharedPreferences.localStorage?.remove(MySharedPreferences.userToken);
          MySharedPreferences.localStorage?.remove(MySharedPreferences.userId);
          Get.offAll(const LoginScreen());
        }, child: Text("Confirm"))
      ]);
}


showSuccess({
  String title = "",
  String description = "",
  SnackPosition position = SnackPosition.TOP,
}){
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    backgroundColor: Colors.blueAccent,
    snackPosition: position,
    barBlur: 0,
  );
}