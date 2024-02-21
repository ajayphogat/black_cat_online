import 'package:black_cat_online/provider/all_product_provider.dart';
import 'package:black_cat_online/provider/login_provider.dart';
import 'package:black_cat_online/utils/my_shared_preference.dart';
import 'package:black_cat_online/utils/my_theme.dart';
import 'package:black_cat_online/views/bottom_bar/tab_screen.dart';
import 'package:black_cat_online/views/login_screen/welcome_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constraint/http_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await MySharedPreferences.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.blue,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllProductProvider>(
          create: (context) => AllProductProvider(),
        ),
        ChangeNotifierProvider<AllCategoriesProvider>(
          create: (context) => AllCategoriesProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Themes.light,
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? image;
  String? title;
  bool? isLogin = false;
  bool loading = false;
  @override
  void initState() {
    final adminToken = MySharedPreferences.localStorage
            ?.getString(MySharedPreferences.adminToken) ??
        "";
    if (adminToken.isEmpty) {
      isLogin = false;
    }
    // TODO: implement initState


    super.initState();
    final login = MySharedPreferences.localStorage
            ?.getBool(MySharedPreferences.isLogin) ??
        false;
    final introSeen = MySharedPreferences.localStorage
            ?.getBool(MySharedPreferences.introSeen) ??
        true;
    // final logo =MySharedPreferences.localStorage?.getString(MySharedPreferences.logoUrl) ??"";
    const logo = "assets/images/Splash.jpg";
    if (logo.isNotEmpty) {
      setState(() {
        image = logo;
      });
    }

    isLogin = login;
    //print("Login value =  $login");

    get().whenComplete(() {
      if (mounted) {
        setState(() {});
      }
    });
    Future.delayed(const Duration(seconds: 5)).then((value) {
      if (introSeen) {
        // Get.off(const IntroductionScreen());

        //remove when available intro screen
        Get.off(isLogin == true
            ? TabScreen(
                index: 0,
              )
            : const WelcomeScreen());
      } else {
        // Get.off(login ? const TabScreen() : const WelcomeScreen());
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    //print("image $image");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (image != null)
              Center(
                child: Image.asset(
                  image!,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                // MyCacheNetworkImages(imageUrl: image!, radius: 0,height: 150,width: 150,)
              ),
            // Text(projectAppName,style: Theme.of(context).textTheme.headline3,)
          ],
        ),
      ),
    );
  }

  Future get() async {
    //url == loginUrl
    final response = await HttpService.getRequest(url: "");
    //print(response);
    loading = false;
    if (response == null) {
      return;
    }
    if (response["status"] != "success") {
      //print("login api unsuccess == $response");
      return;
    } else {
      //print("login api success == $response");

    }
    final pref = await SharedPreferences.getInstance();
    if (image != response["logging_img"]) {
      image = response["logging_img"];
      pref.setString(MySharedPreferences.logoUrl, image ?? "");
    }
    if (title != response["title"]) {
      title = response["title"];
      pref.setString(MySharedPreferences.appName, title!);
    }
  }
}
