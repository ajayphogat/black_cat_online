

import 'package:black_cat_online/views/Profile/profile_model.dart';
import 'package:black_cat_online/views/cart/cart_model.dart';
import 'package:black_cat_online/views/home/home_model.dart';
import 'package:flutter/material.dart';
import '../Api Service/api_service.dart';
import '../views/home/all_product_model.dart';


class AllCategoriesProvider with ChangeNotifier{
  final  _allData = ApiService();
  bool isLoading = false;
  List<CategoriesData> item = [];
  List<CategoriesData> get todos => item;


  ApiService get getAllCate {
    return _allData;
  }
  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    final response = await _allData.getAllCategories();

    item = response;
    isLoading = false;
    notifyListeners();
  }
}

class AllProductProvider with ChangeNotifier{
 final  _allData = ApiService();
 bool isLoading = false;
 List<AllProduct> allProduct = [];
 List<AllProduct> get todos => allProduct;


  ApiService get getAllData {
    return _allData;
  }
 Future<void> getProductData() async {
   isLoading = true;
   notifyListeners();

   allProduct= await _allData.getAllProduct();


   isLoading = false;
   notifyListeners();
 }
}

class CartProvider with ChangeNotifier{
  final  _allData = ApiService();
  bool isLoading = false;
  CartModel? allProduct;
  CartModel? get todos => allProduct;
  int count = 0;
  String? message = "";
  String? quotesId;


  ApiService get getAllData {
    return _allData;
  }

  Future<void> getQuotes() async {
    isLoading = true;
    notifyListeners();

    quotesId= await _allData.getQuotes();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getCartData() async {
    isLoading = true;
    notifyListeners();

    allProduct= await _allData.showCartItem();

    isLoading = false;
    notifyListeners();
  }



  Future<void> addCartData(sku, quantity) async {
    isLoading = true;
    notifyListeners();

   var a= await _allData.addCartItem(sku, quantity);


    isLoading = false;
    notifyListeners();
  }
// Future<void> deleteCartItem( String productid)async{
//
//   isLoading = true;
//   notifyListeners();
//
//   allProduct= await _allData.deleteCartItem(productid);
//
//
//   isLoading = false;
//   notifyListeners();
//
// }

  Future<void> incrimentCount()async {
  count++;
  notifyListeners();
  }

  void decrimentCount(){
    if(count < 1){
      notifyListeners();
      return;
    }
    count--;
    notifyListeners();
  }

}

class ProfileProvider with ChangeNotifier{
  final  _allData = ApiService();
  bool isLoading = false;
  UserProfileModel? profileModel;
  UserProfileModel? get todos => profileModel;
  int count = 0;
  String? message = "";


  ApiService get getAllData {
    return _allData;
  }
  Future<void> getProfileData() async {
    isLoading = true;
    notifyListeners();

    profileModel= await _allData.showProfile();

    isLoading = false;
    notifyListeners();
  }



}

