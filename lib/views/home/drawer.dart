
import 'package:black_cat_online/widgets/cache_network_image_widget.dart';

import '../../utils/my_shared_preference.dart';
import '../login_screen/login_screen.dart';
import '/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_model.dart';

class DrawerScreen extends StatefulWidget {
  final  List<CategoriesData> list;
  const DrawerScreen({Key? key, required this.list, }) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String studentType = "";
  int currentIndex = 0;
  int? ids;
  // List<CategoriesData> womens = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
  // womens = widget.list;
    });
  }

  List<String> subCategory = [];

  final menu = [
    /*
   SideMenuModel(
        icon: "assets/drawer/report.PNG",
        title: "Report",
        onTap: () {}),
        */
    SideMenuModel(
        icon:"assets/images/img_01.PNG",
        title: "Women",
        onTap: () {

          // Get.to(const RecalculateReportScreen());
        }),
    SideMenuModel(
        icon:"assets/images/img_02.PNG",
        title: "Men",
        onTap: () {
          // Get.to(const BookmarkScreen());
        }),
    SideMenuModel(
      icon: "assets/images/img_03.PNG",
      title: "Kids",
      onTap: () {
        // Get.to(const DownloadScreen());
      },
    ),

    /*SideMenuModel(
        icon: "assets/drawer/profile.png",
        title: "Profile",
        onTap: () {
          Get.to(const UpdateProfile());
        }),*/
    SideMenuModel(
        icon:"assets/images/img_04.PNG",
        title: "Beauty",
        divider: const Divider(
          thickness: 2,
        ),
        onTap: () {
          // Get.to(NotificationScreen());
        }),
    SideMenuModel(
        icon: "assets/images/img_05.PNG",
        title: "Home",
        divider: const Divider(
          thickness: 2,
        ),
        onTap: () {
          // Get.to(const HelpCenterScreen());
        }),
    // SideMenuModel(
    //     icon: "assets/images/img_06.PNG",
    //     title: "Electronics",
    //     onTap: () {
    //       // Get.to(const ChangeLanguageScreen());
    //     }),
    //
    // SideMenuModel(
    //     icon: "assets/images/img_07.PNG",
    //     title: "Corporate Sale",
    //     onTap: () {
    //       // Get.to(const SettingsScreen());
    //     }),
    //
    // SideMenuModel(
    //     icon: "assets/images/img_07.PNG",
    //     title: "Corporate Sale",
    //     onTap: () {
    //       // Get.to(const SettingsScreen());
    //     }),
    // SideMenuModel(
    //     icon: "assets/images/setting.png",
    //     title: "setting",
    //     onTap: () {
    //       // Get.to(const SettingsScreen());
    //     }),
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Card(
            elevation: 8,
            color: Theme.of(context).primaryColor,
            // child: ListTile(
            //
            //   leading: MyCacheNetworkImages(imageUrl: "https://tinypng.com/images/social/website.jpg",
            //       radius: 50,
            //   width: 60,height: 70,),
            //     /*leading: CircleAvatar(
            //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //         backgroundImage: NetworkImage(MySharedPreferences.localStorage
            //             ?.getString(MySharedPreferences.profileImage) ??
            //             "")),*/
            //     title: Text(
            //         MySharedPreferences.localStorage?.getString(MySharedPreferences.userName) ??
            //             "User Name",
            //         style: Theme.of(context)
            //             .textTheme
            //             .headline3
            //             ?.copyWith(fontWeight: FontWeight.bold),
            //         maxLines: 1),
            //     subtitle: Text.rich(TextSpan(text:
            //     MySharedPreferences.localStorage
            //         ?.getString(MySharedPreferences.userClass) ??
            //         "User Class",
            //         style: Theme.of(context).textTheme.bodyText1,
            //         children: [
            //           const TextSpan(text:  "  "),
            //           // TextSpan(text: widget.exam)
            //         ]
            //
            //     ))),
          ),
         /* Visibility(
            visible: studentType != "2",
            replacement: const SizedBox(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MyButton(
                title: "Change Class".toUpperCase(),
                onTap: () {
                  Get.back();
                  // Get.to(const SelectClassScreen());
                },
                height: 35,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
*/
          ListView.separated(
            shrinkWrap: true,
            itemCount: widget.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox();
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      horizontalTitleGap: 10,
                      // leading: Image.asset(
                      //   menu[index].icon,
                      //   width: 40,
                      //   height: 40,
                      // ),
                      title: Text(widget.list[index].name ?? "",
                          style: Theme.of(context).textTheme.subtitle1),
                      trailing:GestureDetector(
                        onTap: (){
                          setState(() {
                            if(subCategory.isNotEmpty){
                              currentIndex = index;
                              subCategory.clear();

                              print("clear");
                            }else {
                              currentIndex = index;
                              subCategory.add(widget.list[index].childrenData1.toString() ?? "");
                              print(subCategory.length);
                            }
                          });
                        },
                          child: ( subCategory.isNotEmpty && currentIndex == index)? Icon(Icons.arrow_drop_up):
                          Icon(Icons.arrow_drop_down)
                        ,)
                    ),

                    ( subCategory.isNotEmpty && currentIndex == index) ?
                    Container(
                      padding: EdgeInsets.only(left: 60,right: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategory.length,
                        itemBuilder: (context, i) =>
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${subCategory[i]}",style: Theme.of(context).textTheme.subtitle1),
                              Icon(Icons.arrow_forward_ios,size: 12,)],
                            ),),
                    ) : Container(),
                  ],
                ),
              );
            },
          ),


          // ListTile(
          //   dense: true,
          //   onTap: () {
          //     Get.back();
          //     showAlertDialog(context);
          //   },
          //   contentPadding:
          //   const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          //   horizontalTitleGap: 0,
          //   leading: Image.asset("assets/images/setting.png",width: 35,),
          //   title: Text("Logout", style: Theme.of(context).textTheme.subtitle1),
          //   trailing: const Icon(Icons.chevron_right),
          // ),

          ListTile(
            dense: true,
            onTap: () {
              Get.back();
              showAlertDialog(context);
            },
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            horizontalTitleGap: 0,
            leading: Icon(Icons.logout),
            title: Text("Logout", style: Theme.of(context).textTheme.subtitle1),
            trailing: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: const Text("Logout"),
      onPressed: () {
        MySharedPreferences.localStorage?.remove(MySharedPreferences.isLogin);
        MySharedPreferences.localStorage?.remove(MySharedPreferences.adminToken);
        MySharedPreferences.localStorage?.remove(MySharedPreferences.userToken);
        MySharedPreferences.localStorage?.remove(MySharedPreferences.userId);
        MySharedPreferences.localStorage
            ?.remove(MySharedPreferences.userStatus);
        // MySharedPreferences.localStorage?.remove(MySharedPreferences.userClass);
        MySharedPreferences.localStorage?.remove(MySharedPreferences.userName);
        MySharedPreferences.localStorage?.clear();
        Get.offAll(const LoginScreen());
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        remindButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class SideMenuModel {
  final String icon;
  final String title;
  final void Function() onTap;
  Divider? divider;

  SideMenuModel(
      {this.divider,
        required this.icon,
        required this.title,
        required this.onTap});
}
