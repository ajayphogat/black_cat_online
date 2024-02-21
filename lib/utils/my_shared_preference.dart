import 'package:shared_preferences/shared_preferences.dart';

import '../views/bottom_bar/bottom_navigation.dart';

class MySharedPreferences {
  static const introSeen="introSeen";
  static const userId="userId";
  static const userToken = 'user_token';
  static const adminToken = 'admin_token';
  static const deviceId = 'deviceId';
  static const isLogin = 'isLogin';
  static const logoUrl = 'logoUrl';
  static const appName = 'appName';
  static const userStatus = 'userStatus';
  static const userName = 'username';
  static const profileImage = 'profileImage';
  static const languagePreference = 'languagePreference';
  static const studentType = 'studentType';

  static const firstName = 'first_name';
  static const lastName = 'last_name';
  static const mobile = 'mobile';
  static const email = 'email';
  static const address = 'address';

  static const quoteId = 'quoteId';

  //Todo:--------
  static SharedPreferences? localStorage;
  static Future init() async => localStorage = await SharedPreferences.getInstance();
  static String title =localStorage?.getString(appName) ?? projectAppName;
  static String? image = localStorage?.getString(logoUrl);
}




