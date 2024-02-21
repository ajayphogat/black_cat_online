import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:black_cat_online/provider/all_product_provider.dart';
import 'package:black_cat_online/views/SingleProduct/description_screen.dart';
import 'package:black_cat_online/views/all_products/category_products.dart';
import 'package:black_cat_online/views/home/all_product_model.dart';
import 'package:http/http.dart' as http;

import 'package:black_cat_online/views/home/drawer.dart';
import 'package:black_cat_online/views/home/my_slider.dart';
import 'package:black_cat_online/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constraint/http_service.dart';
import '../../constraint/urls.dart';
import '../../utils/my_shared_preference.dart';
import '../../widgets/cache_network_image_widget.dart';
import '../Profile/profile_screen.dart';
import '../bottom_bar/tab_screen.dart';
import '../cart/cart_screen.dart';
import 'home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> a = [
    "https://www.cbazaar.com/blog/wp-content/uploads/2022/03/Wedding_Page_IPB.jpg",
    "https://i.pinimg.com/originals/3f/35/ee/3f35eead28bbae56c4e1ba8d61c471d0.jpg",
    "https://d26dm7ayqnmdyf.cloudfront.net/wp-content/uploads/2016/03/LSD788-294.jpg",
    "https://media.kreeva.com/wysiwyg/CategoryBlock/LehangaCholi/oct/Diwali_lehenga_Banner_Desktop.jpg",
    "https://i.pinimg.com/originals/c1/79/0c/c1790c0a6151f57deb77304e533d6d5d.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.3),
        child: AppBar(
          elevation: 2,
          shadowColor: Colors.white60,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              // Get.to(
              //   Profile(bikes: []),
              // );

              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                _scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
              // _scaffoldKey.currentState?.openDrawer();
              //Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/icon_1.PNG",
              scale: .4,
              width: width * .06,
              height: height * .02,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(
                    CartScreen(),
                  );
                },
                child: Consumer<CartProvider>(
                  builder: (context, value, child) => Badge(
                    // showBadge: true,
                    badgeColor: Theme.of(context).primaryColor,
                    position: BadgePosition.topEnd(top: 1),
                    badgeContent: value.allProduct?.items != null
                        ? Text(
                            "${value.allProduct!.items!.length}",
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        : Text(
                            "0",
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {},
                child: Icon(Icons.notification_important_outlined)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabScreen(index: 3),
                    ),
                  );
                },
                child: Icon(Icons.person_outline)),
            // MyCacheNetworkImages(
            //   imageUrl:
            //   "https://tinypng.com/images/social/website.jpg",
            //
            //   radius: 40,
            // ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      drawer: Consumer<AllCategoriesProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return DrawerScreen(
          list: value.item,
        );
      }),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        flex: 8,
                        child: MyTextFormWidget(
                            hintText: "Search Here...",
                            sufixIcon: const Icon(Icons.search),
                            controller: searchController),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          // heightFactor: double.infinity,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.filter_alt_off,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .015,
                  ),
                  Container(
                    width: width,
                    height: 30,
                    child: Consumer<AllCategoriesProvider>(
                        builder: (context, value, child) {
                      if (value.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.item.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AllCateGoryProducts(
                                categoriesData: value.item[index],
                              ));
                            },
                            child: Container(
                              width: width * .17,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // MyCacheNetworkImages(
                                  //     imageUrl:
                                  //         "${serverURL + value.item[index].customAttributes![0].value!}",
                                  //     height: 60,
                                  //     width: 60,
                                  //     radius: 50),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Text(
                                    value.item[index].name ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: Colors.blue),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Column(
                children: [
                  // Consumer<AllCategoriesProvider>(
                  //     builder: (context, value, child) {
                  //   if (value.isLoading) {
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }
                  //   return MySlider(a);
                  // }),

                  MySlider(silderData: a),
                  const SizedBox(
                    height: 20,
                  ),
                  //Grid

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Latest Product",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    // height: height * .07,
                    child: Consumer<AllCategoriesProvider>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GridView.custom(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                childAspectRatio: 2
                                // repeatPattern: QuiltedGridRepeatPattern.mirrored,
                                ),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: value.item[0].childrenData1?.length,
                                (context, index) {
                              final data = value.item[0];
                              return Container(
                                width: width * .16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // MyCacheNetworkImages(
                                    //   imageUrl:
                                    //       "https://www.blackcatonline.com${value.item[index].customAttributes![0].value!}",
                                    //   radius: 10,
                                    //   height: 80,
                                    //   width: 60,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 2),
                                      child: Text(
                                        data.childrenData1?[index].name ?? "",
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }));
                      },
                    ),
                  ),

                  // Banner

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Product",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("abc");
                          // Get.to(TabScreen(index: 1));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabScreen(index: 1),
                              ));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "View all",
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: height * .52,
                    child: Consumer<AllProductProvider>(
                        builder: (context, value, child) {
                      if (value.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (value.allProduct.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .83,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(value.allProduct[index].id);
                              Get.to(ProductDescription(
                                  productId:
                                      value.allProduct[index].id.toString()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyCacheNetworkImages(
                                    imageUrl: productImage +
                                        "${value.allProduct[index].customAttributes![0].value}",
                                    height: height * .2,
                                    width: width,
                                    radius: 10,
                                  ),

                                  // "https://www.blackcatonline.com/pub/media/catalog/product/cache/77bffe63aab4a0de809337755b9a2009/s/a/salwar_suit_peach_1.jpeg"
                                  /* MyCacheNetworkImages(
                                    imageUrl: a[index],
                                    height: height * .19,
                                    width: width,
                                    radius: 10,
                                  ),*/
                                  SizedBox(height: 5,),
                                  Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.allProduct[index].name ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Text(
                                          value.allProduct[index].price
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
