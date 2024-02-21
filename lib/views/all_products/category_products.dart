
import 'package:black_cat_online/views/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constraint/urls.dart';
import '../../widgets/cache_network_image_widget.dart';
import '../SingleProduct/description_screen.dart';

class AllCateGoryProducts extends StatefulWidget {
 final CategoriesData categoriesData;

  const AllCateGoryProducts({Key? key, required this.categoriesData}) : super(key: key);

  @override
  State<AllCateGoryProducts> createState() => _AllCateGoryProductsState();
}

class _AllCateGoryProductsState extends State<AllCateGoryProducts> {

  int currentIndex = 0;
  List<String> subCategory = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          widget.categoriesData.name ?? "",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Column(
          children: [
            Container(
              height: height*.022,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                itemCount: widget.categoriesData.childrenData1?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(subCategory.isNotEmpty){
                          currentIndex = index;
                          subCategory.clear();
                          print("clear");

                        }else {
                          currentIndex = index;
                          subCategory.add(widget.categoriesData.childrenData1?[currentIndex].childrenData1.toString() ?? "");
                          print(subCategory.length);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child:
                      // widget.categoriesData.childrenData1?[index].childrenData1?.length !=0 ?
                      Text(
                        widget.categoriesData.childrenData1?[index].name ?? "",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: currentIndex==index?Colors.blue:Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      )
                          // :null,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height*.02,),




            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  itemCount:  widget.categoriesData.childrenData1?[currentIndex].childrenData1?.length,
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
                        Get.to(ProductDescription(productId: widget.categoriesData.childrenData1?[currentIndex].childrenData1?[index].id.toString() ?? ""));


                        // Get.to(ProductDescription(
                        //     productId:
                        //     value.allProduct[index].id.toString()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyCacheNetworkImages(
                              imageUrl:
                              serverURL + "/pub/media/catalog/category/category-2.jpg",
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
                                    widget.categoriesData.childrenData1?[currentIndex].childrenData1?[index].name ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                   "",
                                    style: Theme.of(context).textTheme.overline,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}