import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/all_product_provider.dart';
import '../utils/my_shared_preference.dart';
import '../views/Profile/profile_model.dart';
import '../views/SingleProduct/single_product_model.dart';
import '../views/cart/cart_model.dart';
import '../views/home/all_product_model.dart';

import '../constraint/http_service.dart';
import '../constraint/urls.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../views/home/home_model.dart';

class ApiService {
  List<AllProduct> allProduct = [];
  List<CategoriesData> items = [];
  List<SubCategoriesData> subCatItems = [];
  SingleItems? data;
  String admintoken = "";

  List<CartItems>? cartItems;
  CartModel _cartModel = CartModel();
  String userToken = "";
  String QuotesId = "";

  Future getAllProduct() async {
    print("api in provider");
    admintoken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.adminToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $admintoken"
    };
    final result = await http.get(Uri.parse(allProductsUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      final data = AllProductModel.fromJson(parse);
      allProduct = data.items ?? [];
      return allProduct;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {}
    return allProduct;
  }

  Future getAllCategories() async {
    admintoken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.adminToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $admintoken"
    };
    print(headers);
    final result = await http.get(Uri.parse(categoriesUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      final homeData = HomeModel.fromJson(parse);
      items = homeData.childrenData ?? [];

      // subCatItems  = items.where((element) => element.childrenData1);
      // subCatItems = items.where((element) => element.childrenData1.where((e) => element.parentId==))
      
      return items;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");

    }
    return items;
  }

  Future getQuotes() async {
    userToken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.userToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };
    print(headers);
    final result = await http.post(Uri.parse(quotesUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      // productQuotesId = result.body.toString();
      // print(productQuotesId);
     MySharedPreferences.localStorage?.setString("quoteId", result.body.toString());
      return QuotesId;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");

    }
    return QuotesId;
  }

  Future addCartItem(String sku, int quantity) async {
   final productQuotesId = MySharedPreferences.localStorage?.getString(MySharedPreferences.quoteId)??"";
    print("add cart start");
    userToken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.userToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };
    final body = json.encode({
      "cartItem": {"sku": sku, "qty": quantity, "quote_id": "$productQuotesId"}
    });

    print(body);
    final result =
        await http.post(Uri.parse(addcartUrl), headers: headers, body: body);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
     HttpService.showAlertSuccess();
      return ;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");
    }
    return _cartModel;
  }

  Future showCartItem() async {
    print("after delete");
    userToken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.userToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };

    print(headers);
    final result = await http.get(Uri.parse(quotesUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      _cartModel = CartModel.fromJson(parse);
      cartItems = _cartModel.items ?? [];
      return _cartModel;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");
    }
    return _cartModel;
  }



  UserProfileModel _profileModel = UserProfileModel();

  Future showProfile() async {
    print("profile");
    userToken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.userToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };

    print(headers);
    final result = await http.get(Uri.parse(showProfileUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      _profileModel = UserProfileModel.fromJson(parse);

      MySharedPreferences.localStorage?.setString("first_name", _profileModel.firstname ?? "");
      MySharedPreferences.localStorage?.setString("last_name", _profileModel.lastname ?? "");
      MySharedPreferences.localStorage?.setString("email", _profileModel.email ?? "");

      if(_profileModel.addresses!.length >= 1){
        MySharedPreferences.localStorage?.setString("mobile", parse["addresses"][0]["telephone"] ?? "");
      }
      // MySharedPreferences.localStorage?.setString("address", parse["addresses"]);
      // MySharedPreferences.localStorage?.setStringList("street", parse["addresses"][0]["street"]);
      // print(parse["addresses"][0]["telephone"]);


      return _profileModel;
    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");
    }
    return _profileModel;
  }


}
