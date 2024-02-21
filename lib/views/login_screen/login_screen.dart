import 'dart:convert';
import 'package:black_cat_online/views/login_screen/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:black_cat_online/constraint/urls.dart';
import 'package:black_cat_online/views/bottom_bar/tab_screen.dart';
import 'package:black_cat_online/widgets/my_button.dart';
import 'package:black_cat_online/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constraint/http_service.dart';
import '../../provider/login_provider.dart';
import '../../utils/my_shared_preference.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController =
      TextEditingController(text: "t001@mailinator.com");
  TextEditingController passwordController =
      TextEditingController(text: "testing001@1234");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool callApi = false;
  bool valid = false;
  bool isSelected = false;
  String checkBoxCaption =
      "By using this form you agree with  the storage and handling of your data by this website";

  save() {
    print("abc");
    if (!_formKey.currentState!.validate()) {
      return valid = true;
    }
    if (callApi == false) {
      callApi = true;
      valid = false;
      getLogin().then((value) => callApi=false);
    }
    //    .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data'))))
  }

  Future getLogin() async {
    print(usernameController.text);


    final body = json.encode({
      "username": usernameController.text,
      "password": passwordController.text
    });
    final headers = {"Content-Type": "application/json"};


    final result =
        await http.post(Uri.parse(loginUrl), body: body, headers: headers);
    final paras = jsonDecode(result.body);

    print(result.statusCode);
    if (result.statusCode == 200) {
      print("200 aaya h");

      print(result.body.replaceAll('"', ''));
      MySharedPreferences.localStorage?.setBool("isLogin", true);
      MySharedPreferences.localStorage?.setString("admin_token", "raacpe6hvuaghphmgct06td2lemfybdr");
      MySharedPreferences.localStorage?.setString("user_token", result.body.replaceAll('"', ''));
      // getAdminToken();
      getQuotes();
      Get.offAll(TabScreen(
        index: 0,
      ));
    } else {
      print("200 to nhi aaya h");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect Username or Password")));
    }
  }
  Future getQuotes() async {
   final userToken = MySharedPreferences.localStorage
        ?.getString(MySharedPreferences.userToken) ??
        "";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };
    print(headers);
    final result = await http.post(Uri.parse(quotesUrl), headers: headers);
    final parse = jsonDecode(result.body);

    if (result.statusCode == 200) {
      // productQuotesId = result.body.toString();
      // print(productQuotesId);
      MySharedPreferences.localStorage?.setString("quoteId", result.body.toString());

    } else if (result.statusCode == 401) {
      return HttpService.showAlertDialog();
    } else {
      // print("200 to nhi aaya h");

    }

  }
  // Future getAdminToken() async {
  //   print("storeadmin");
  //
  //
  //   final body = json.encode({
  //     "username": "storeadmin",
  //     "password": "Blackcat@2022#y"
  //   });
  //   final headers = {"Content-Type": "application/json"};
  //
  //
  //   final result =
  //   await http.post(Uri.parse(adminUrl), body: body, headers: headers);
  //   final paras = jsonDecode(result.body);
  //
  //   print(result.statusCode);
  //
  //   if (result.statusCode == 200) {
  //     print("admin bhi aaya h");
  //     print(result.body.toString());
  //     MySharedPreferences.localStorage?.setString("admin_token", result.body.replaceAll('"', ''));
  //     callApi = false;
  //     Get.offAll(TabScreen(
  //       index: 0,
  //     ));
  //   } else {
  //     print("admin authorised  nhi  h");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Incorrect Username or Password")));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              "Welcome Back! ",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 10),
            Text(
              "If you have an account, sign in with your email address. ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  MyTextFormWidget(
                    hintText: 'Enter Email',
                    validator: (email) {
                      if (email!.isEmpty || email.trim().isEmpty) {
                        return 'enter email';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) {
                        return 'enter valid email';
                      }
                      return null;
                    },
                    prifixIcon: Icon(Icons.mail),
                    controller: usernameController,
                    keyBoardType: TextInputType.phone,
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  MyTextFormWidget(
                    hintText: 'Enter Password',
                    prifixIcon: Icon(Icons.lock),
                    controller: passwordController,
                    keyBoardType: TextInputType.phone,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'please enter password';
                      }
                      if (password.length < 6) {
                        return 'please at least enter minimum 6 character in Alpha-Numeric';
                      }
                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            ChangeNotifierProvider<LoginScreenProvider>(
              create: (context) => LoginScreenProvider(),
              child: Consumer<LoginScreenProvider>(
                builder: (context, provider, child) => Column(
                  children: [
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.start,
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Checkbox(
                            value: isSelected,
                            activeColor:
                                isSelected == false ? Colors.red : Colors.green,
                            onChanged: (bool? value) {
                              setState(() {
                                isSelected = value ?? false;
                                if (isSelected == true) {
                                  provider.checked(true);
                                }
                              });
                            },
                          ),
                        ),
                        Flexible(
                            flex: 9,
                            child: Text(
                              checkBoxCaption,
                              style: Theme.of(context).textTheme.caption,
                            )),
                        // Flexible(flex: 1, child: Container())
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        provider.message.toString(),
                        style: TextStyle(
                          color: provider.ischecked != true
                              ? Colors.red
                              : Colors.transparent,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Align(
                      alignment: Alignment.center,
                      child: MyButton(
                        width: width * .95,
                        height: width * .1,
                        title: "LOG IN",
                        onTap: () {
                          if (isSelected == true) {
                            provider.checked(true);
                            save();
                          } else {
                            provider.checked(false);
                          }
                          // save();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text('Don\'t have an account? ', style: Theme.of(context).textTheme.subtitle1,),
                GestureDetector(
                  child:  Text(
                      ' Sign up',
                      style: TextStyle(color: Colors.blue,fontSize: 14),textScaleFactor: 1
                  ),
                  onTap: () => Get.to(SignUpScreen()),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
