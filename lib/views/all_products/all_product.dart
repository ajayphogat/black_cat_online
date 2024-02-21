import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constraint/urls.dart';
import '../../provider/all_product_provider.dart';
import '../../widgets/cache_network_image_widget.dart';
import '../SingleProduct/description_screen.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "All Products",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Consumer<AllProductProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  itemCount:  value.allProduct.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
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
                              imageUrl: productImage + "${value.allProduct[index].customAttributes![0].value}",
                              height: height * .18,
                              width: width,
                              radius: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.allProduct[index].name ?? "",maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1,
                                  ),
                                  Text(
                                    value.allProduct[index].price ??"",
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
        ),
      ),
    );
  }
}