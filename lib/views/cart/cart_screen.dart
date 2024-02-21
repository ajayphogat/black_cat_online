import 'dart:convert';

import 'package:black_cat_online/constraint/http_service.dart';
import 'package:black_cat_online/provider/all_product_provider.dart';
import 'package:black_cat_online/views/bottom_bar/tab_screen.dart';
import 'package:black_cat_online/widgets/cache_network_image_widget.dart';
import 'package:black_cat_online/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../constraint/urls.dart';
import '../../utils/app_color.dart';
import '../../utils/my_shared_preference.dart';
import 'cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String img = 'https://tinypng.com/images/social/website.jpg';
  List<String> drop = ['1', '2', '3'];
  String value = "";
  String amount = '';
  String cartTotal = "";

  getItemPrice(price, qty) {
    amount = (price * qty).toString();
    return amount;
  }
String? quotesId;
  @override
  void initState() {
    quotesId =  MySharedPreferences.localStorage?.getString(MySharedPreferences.quoteId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: Theme
              .of(context)
              .textTheme
              .headline4,
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                list = value.allProduct?.items ?? [];
                return Visibility(
                  visible: quotesId != null,
                  replacement: Center(child: CircularProgressIndicator.adaptive(),),
                  child: Visibility(
                    visible : list.isNotEmpty,
                    replacement: Center(child: Text("Cart Empty", style: Theme.of(context).textTheme.headline4,),),
                    child: ListView(
                      children: [
                        Container(
                          height: height *.05,
                          child: Text("Address:",style: Theme.of(context).textTheme.subtitle1,),
                        ),
                        Container(
                            height: height*.68,
                            width: width,
                            child: ListView.builder(
                              itemCount: (value.allProduct?.items?.length ?? 0)+1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return
                                  index !=(value.allProduct?.items?.length) ?
                                  Card(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    leading: MyCacheNetworkImages(
                                      imageUrl: serverURL + "/pub/media/catalog/product/cache/77bffe63aab4a0de809337755b9a2009${value.allProduct?..items?[index]}",
                                      width: 100,
                                      height: 100,
                                      radius: 10,
                                    ),
                                    // leading: Image.network(img),
                                    title: Text(
                                      value.allProduct?.items?[index].name ?? "",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText1,
                                    ),
                                    // subtitle: Text("${double.parse(value.allProduct!.items![index].price.toString()) * value.allProduct!.items![index].qty!}".trim() ,style: Theme.of(context).textTheme.overline,),
                                    subtitle: Text(
                                      getItemPrice(
                                          double.parse(value
                                              .allProduct!.items![index].price
                                              .toString()),
                                          int.parse(value.allProduct!.items![index].qty!)),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .overline,
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              print(
                                                  value.allProduct?.items?[index]
                                                      .itemId);

                                              setState(() {
                                                deleteCartItem(
                                                    "${value.allProduct
                                                        ?.items?[index].itemId}");
                                              });
                                            },
                                            child: Icon(Icons.delete)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Qty.: ${value.allProduct?.items?[index]
                                              .qty.toString()}",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .overline,
                                        ),
                                        /* Container(
                                    height: 22,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.black),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              value.decrimentCount();
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              size: 20,
                                            )),
                                        Text(
                                          value.allProduct?.items?[index].qty
                                                  .toString() ??
                                              "",
                                          style: Theme.of(context).textTheme.overline,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              value.incrimentCount();
                                            },
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                            ))
                                      ],
                                    ),*/
                                      ],
                                    ),
                                  ),
                                )
                                      :  Card(
                                        child: Container(
                                          // height: height * .4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Summary",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .bodyText1),
                                                Divider(),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Estimate Shipping and tax",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .subtitle1,
                                                    ),
                                                    DropdownButton(
                                                      // hint: Text(sel ?? ""),
                                                      style: TextStyle(color: Colors.black),
                                                      // value: value,
                                                      // icon: const Icon(Icons.keyboard_arrow_down),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // var index = widget.subCategory
                                                          //     .indexWhere((element) => element.subCategoryId == value);
                                                          // var selectedCate = widget.subCategory.elementAt(index);
                                                          // selectedItem = selectedCate.subCategoryId ?? "0";
                                                          //
                                                          // print("basic ==$selectedItem");
                                                          // scroller = 0;
                                                          // getData();
                                                        });
                                                      },
                                                      items: drop.map((items) {
                                                        // print("name==${items.subCategoryName}");
                                                        return DropdownMenuItem(
                                                          value: value,
                                                          child: Text(
                                                            items,
                                                            style: TextStyle(color: Colors.black),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "SubTotal",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .subtitle1,
                                                    ),
                                                    Text(
                                                      a(),
                                                      style: Theme.of(context).textTheme.subtitle1,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "SubTotal",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    Text(a(),
                                                      style: Theme.of(context).textTheme.subtitle1,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),);
                              },

                            )),
                        Card(
                          child: MyButton(title: "Palace Order",
                            width: 300,
                            height: 40,
                            onTap: () {

                          },)
                        )

                  ]
                  ,
                  )
                  ,
                  ),
                );
              },
            ),
          )),
    );
  }

  List<CartItems> list = [];
  String? total;
   a() {
     total= list.fold<num>(0, (a, b) => a + double.parse(b.price ?? "0.0")).toString();

  return total ?? "0" ;
  }

  deleteCartItem(String productid) async {
    print("productid==$productid");
    final userToken = MySharedPreferences.localStorage
        ?.getString(MySharedPreferences.userToken) ??
        "";
    print(userToken);
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };

    print(headers);
    final result = await http.delete(
        Uri.parse(
            "https://www.blackcatonline.com/rest/V1/carts/mine/items/$productid"),
        headers: headers);
    final parse = jsonDecode(result.body);
    print(deleteItemUrl + productid);
    print(result.statusCode);

    if (result.statusCode == 200) {
      // print(result.body.toString());

      return Provider.of<CartProvider>(context, listen: false).getCartData();
      // return  Navigator.push(context, MaterialPageRoute(builder: (context) => TabScreen(index: 2),));

    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");
    }
    return Get.to(TabScreen(index: 1));
  }
}
