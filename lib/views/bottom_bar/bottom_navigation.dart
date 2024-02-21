import 'package:badges/badges.dart';
import 'package:black_cat_online/provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottom extends StatefulWidget {
  final int bottomSelectedIndex;
  final Function bottomTapped;

  const Bottom(
      {Key? key, required this.bottomSelectedIndex, required this.bottomTapped})
      : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List<BottomNavigationBarItem> buildBottomNavBarItems = [
    const BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home)),
    const BottomNavigationBarItem(
        label: "Category",
        icon:Icon(Icons.category_outlined)),
     BottomNavigationBarItem(
        label: "Cart",
        icon: Consumer<CartProvider>(
          builder: (context, value, child) =>
          Badge(
            // showBadge: true,
            badgeContent: value.allProduct?.items != null ?
            Text("${value.allProduct!.items!.length }") : Text("0"),
            child: Icon(Icons.shopping_cart),),
        ),),
    const BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(Icons.person_outline)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0), ),

      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: buildBottomNavBarItems,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          elevation: 8,
          backgroundColor: Colors.black,
          currentIndex: widget.bottomSelectedIndex,
          onTap: (index) => widget.bottomTapped(index),
          selectedFontSize: 14,
          unselectedFontSize: 12,

      ),
    );
  }
}

class NavItems {
  String title;
  Widget icon;

  NavItems({required this.title, required this.icon});
}
const projectAppName = "Black Cat Online";
const stripeSecretKey = "sk_test_51HfICsEFwfZ1T0dytRNcZc5T1MY4sLn4xfgpAkt480ZwA7LFRL7hNQ7UNbG8DF36WkzQuaO0KKH3ziekdnI1xL4300LNgiqRja";  //self account
