import 'package:black_cat_online/views/cart/cart_screen.dart';
import 'package:black_cat_online/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../provider/all_product_provider.dart';
import '../Profile/profile_screen.dart';
import '../all_products/all_product.dart';
import 'bottom_navigation.dart';

class TabScreen extends StatefulWidget {
  final int index;
  const TabScreen({Key? key, required this.index}) : super(key: key);
  @override
  _TabScreenState createState() => _TabScreenState();
}


class _TabScreenState extends State<TabScreen> {
  int? bottomSelectedIndex;
  PageController? pageController;
  DateTime currentBackPressTime = DateTime.now();
  bool loading = false;
  var data;

  @override
  void initState() {
    // fetchApi();
    // TODO: implement initState
    bottomSelectedIndex = widget.index ;
    pageController =
        PageController(initialPage: widget.index, keepPage: true);
    callProviderApi();
    super.initState();
    // studentType = MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType) ?? "";
  }

  callProviderApi() async{
    print("object");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AllCategoriesProvider>(context, listen: false)
          .getCategories();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await  Provider.of<AllProductProvider>(context, listen: false).getProductData();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CartProvider>(context, listen: false).getQuotes();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CartProvider>(context, listen: false).getCartData();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ProfileProvider>(context, listen: false).getProfileData();
    });
  }
  /*
  Future<void> fetchApi() async {
    try {
      final token = MySharedPreferences.localStorage
          ?.getString(MySharedPreferences.token) ??
          "";
      final headers = {"Authorization": "Bearer $token"};
      //print("headers==$headers");
      final parse = await HttpService.getWithHeaderRequest(
          url: sarasvathiAppUrl, headers: headers);
      if (parse == null) {
        return;
      }
      if (parse["status"] != "success") {
        return;
      }
      //print(parse);
      setState(() {
        if((MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType)??"")=="2") {
          data = SchoolModel.fromJson(parse);
        }
        if((MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType)??"")=="1") {
          data = SarasvathiModel.fromJson(parse);
        }
      });
    } catch (e) {
      throw Exception("Failed to load $e");
    } finally {
      setState(() {
        loading = true;
      });
    }
  }*/
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => pageChanged(index),
              children: [
                HomeScreen(),
                AllProducts(),
                CartScreen(),
                ProfileScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottom(
          bottomSelectedIndex: bottomSelectedIndex!,
          bottomTapped: bottomTapped,
        ),
      ),
    );
  }

  void bottomTapped(int index) {
    setState(
          () {
        bottomSelectedIndex = index;
        pageController!.animateToPage(index,
            duration: const Duration(microseconds: 1), curve: Curves.ease);
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Future<bool> _onWillPop() {
    if (bottomSelectedIndex != 1) {
      setState(
            () {
          pageController!.jumpTo(0);
        },
      );
      return Future.value(false);
    } else if (bottomSelectedIndex == 1) {
      setState(() {
        pageController!.jumpTo(1);
      },);
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      return Future.value(false);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}  