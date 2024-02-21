import 'dart:convert';

import 'package:black_cat_online/Api%20Service/api_service.dart';
import 'package:black_cat_online/utils/app_color.dart';
import 'package:black_cat_online/views/SingleProduct/single_product_model.dart';
import 'package:black_cat_online/views/cart/cart_screen.dart';
import 'package:black_cat_online/widgets/cache_network_image_widget.dart';
import 'package:black_cat_online/widgets/my_button.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constraint/http_service.dart';
import '../../constraint/urls.dart';
import '../../provider/all_product_provider.dart';
import '../../utils/my_shared_preference.dart';
import '../cart/cart_model.dart';

class ProductDescription extends StatefulWidget {
  final String productId;

  const ProductDescription({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String admintoken = "";

  bool isLoading = false;
  SingleItems? data;
  List<SingleItems> singleItems = [];

  getSingleProduct() async {
    setState(() {
      isLoading = true;
    });
    try {
      final headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $admintoken"
      };

      print(headers);
      final result = await http.get(
          Uri.parse(singleProductUrl +
              "searchCriteria[filterGroups][0][filters][0][field]=entity_id&searchCriteria[filterGroups][0][filters][0][value]=${widget.productId}"),
          headers: headers);
      final parse = jsonDecode(result.body);

      if (result.statusCode == 200) {
        // data = parse["items"][0];
        setState(() {
          final homeData = SingleProductModel.fromJson(parse);
          singleItems = homeData.items!;
          data = singleItems.first;
        });
        return data;
      } else if (result.statusCode == 401) {
        return HttpService.showAlertDialog();
      } else {
        // print("200 to nhi aaya h");

      }
      return data;
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    admintoken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.adminToken) ??
        "";

    getSingleProduct();
    super.initState();
  }

  bool checkCart = false;
  int itemIndex = 0;
  int sliderlength = 0;

  PageController? _pageController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.home),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => HomeScreen(),
        //         ),
        //       );
        //     },
        //   ),
        //   SizedBox(width: 10),
        // ],
      ),
      body: SafeArea(
        child: Visibility(
          visible: !isLoading,
          replacement: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * .85,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Visibility(
                  visible: data != null,
                  replacement: Center(
                    child: Text("Product Detail not available"),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: height * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Swiper(
                            viewportFraction: 0.8,
                            scale: 0.9,
                            itemCount: data?.mediaGalleryEntries?.length ?? 0,
                            // shrinkWrap: true,
                            // physics: AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemWidth: width,
                            itemHeight: height*.45,
                            layout: SwiperLayout.STACK,
                            onIndexChanged: (value) {
                              setState(() {
                                itemIndex= value;
                              });
                            },
                            itemBuilder: (context, index) {

                              return  Container(
                                decoration: BoxDecoration(border: Border.all()),
                                child: MyCacheNetworkImages(
                                  imageUrl: productImage+"${data?.mediaGalleryEntries![0].file}" ,
                                  radius: 1,
                                  width: width * .9,
                                ),
                              );
                            },
                          )


                          /*ScrollablePositionedList.builder(
                            itemCount: data?.mediaGalleryEntries!.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            // itemScrollController: _scrollController,
                            itemBuilder: (context, index) => Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all()),
                                  child: MyCacheNetworkImages(
                                    imageUrl: serverURL +
                                        "/pub/media/catalog/product/cache/77bffe63aab4a0de809337755b9a2009${data?.mediaGalleryEntries![0].file}",
                                    radius: 10,
                                    height: height *.45,
                                    width: width * .7,
                                  ),
                                ),
                              ),
                            ),
                          ),*/
                        ),
                      )


                          ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 10,
                          width: 100,
                          child: Center(
                            child: ListView.builder(
                              itemCount: data?.mediaGalleryEntries!.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Align(
                                alignment: Alignment.center,
                                  child: index == itemIndex
                                      ? Icon(
                                          Icons.circle,
                                          size: 13,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          size: 10,
                                        )),
                            ),
                          ),
                        ),
                      ),
                      /*  ListView.builder(
                            itemCount: data?.mediaGalleryEntries!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                MyCacheNetworkImages(
                              imageUrl: serverURL+"/pub/media/catalog/product/cache/77bffe63aab4a0de809337755b9a2009${data?.mediaGalleryEntries![0].file}" ,

                              radius: 10,
                              width: width,
                            ),
                          )),*/
                      SizedBox(height: 25),
                      Text(
                        data?.name ?? "",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0xff000000),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever since the 1500s,\nwhen an unknown.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.graniteGray,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      /*SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (value) {
                          setState(() {
                            rating = value ;
                          });
                        },
                        starCount: 5,
                        rating: rating,
                        size: 20.0,
                        color: Colors.orangeAccent,
                        borderColor: Colors.orangeAccent,
                        spacing:0.0,
                      ),*/
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${data?.price.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.red,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "\$300",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: AppColors.graniteGray,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child:
                                // check.length ==0
                                //     ?
                                ElevatedButton(
                              child: Text(
                                'Add Cart',
                              ),
                              onPressed: () {
                                setState(() {
                                  Provider.of<CartProvider>(context,
                                      listen: false).addCartData(data!.sku!, 1)
                                      .whenComplete(() =>
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .getCartData());
                                });
                              },
                            )
                            //   : ElevatedButton(
                            // child: Text(
                            //   'View Cart',
                            // ),
                            // onPressed: () {
                            //   Get.to(CartScreen());

                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
