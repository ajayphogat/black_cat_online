import 'dart:convert';

import 'package:black_cat_online/provider/login_provider.dart';
import 'package:black_cat_online/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constraint/urls.dart';
import '../../utils/app_color.dart';
import '../../utils/my_shared_preference.dart';
import '../../utils/my_theme.dart';
import '../../widgets/my_button.dart';
import '../../widgets/text_form_widget.dart';
import '../bottom_bar/tab_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSelected = false;
  String checkBoxCaption =
      "By using this form you agree with  the storage and handling of your data by this website";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),

    // ChangeNotifierProvider<LoginScreenProvider>(
    // create: (context) => LoginScreenProvider(),
    // child: Consumer<LoginScreenProvider>(
    // builder: (context, provider, child) =>

        child: ChangeNotifierProvider<RegisterScreenProvider>(
          create: (context) => RegisterScreenProvider(),
          child: Consumer<RegisterScreenProvider>(builder: (context, provider, child) =>  Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  "Personal Information ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 10),
                Text(
                  "If you don't have an account, sign up with your personal information ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 40),
                Text(
                  "First Name ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),            SizedBox(height: 8,),

                MyTextFormWidget(
                  hintText: 'Enter your first name',
                  prifixIcon: const Icon(
                    Icons.lock,
                  ),
                  controller: firstNameController,
                  keyBoardType: TextInputType.phone,
                ),
                SizedBox(height: 10,),

                Text(
                  "Last Name ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),            SizedBox(height: 8,),

                MyTextFormWidget(
                  hintText: 'Enter your last name',
                  prifixIcon: const Icon(
                    Icons.lock,

                  ),
                  controller: lastNameController,
                  keyBoardType: TextInputType.phone,
                ),
                /* Text("Email",style: Theme.of(context).textTheme.labelMedium,),

                  MyTextFormWidget(
                    hintText: 'Enter email',
                    prifixIcom: const Icon(Icons.mail,color: AppColors.black,),
                    controller: emailController,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email.isEmpty || email.trim().isEmpty) {
                        return 'enter email';
                      }
                      if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) {
                        return 'enter valid email';
                      }
                      return null;
                    },
                  ),*/
                SizedBox(height: 10,),

                Text(
                  "Email",
                  style: Theme.of(context).textTheme.subtitle1,
                ),            SizedBox(height: 8,),

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
                  controller: emailController,
                  keyBoardType: TextInputType.phone,
                ),
                SizedBox(height: 10,),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 8,),

                MyTextFormWidget(
                  hintText: 'Enter Password',
                  prifixIcon: const Icon(
                    Icons.lock,
                  ),
                  controller: passwordController,
                  // keyBoardType: TextInputType.phone,
                ),
                /* for (var item in estateRooms)
            CheckboxListTile(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              title: Text('${item}',style: Theme.of(context).textTheme.caption,),
              value: isSelected[estateRooms.indexOf(item)],
              onChanged: (value) {
                var indexOf = estateRooms.indexOf(item);
                setState(() {
                  isSelected[indexOf] = value!;
                  // _roomController.text = '${item.id}';
                  // print('${_roomController.text}');
                });
              },
              controlAffinity: ListTileControlAffinity.leading,),*/
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
                    width: width * .55,
                    height: width * .1,
                    title: "Create an Account",
                    style: Theme.of(context).textTheme.labelMedium,
                    onTap: () {
                      if (isSelected == true) {
                        provider.checked(true);
                        save();
                      } else {
                        provider.checked(false);
                      }
                      // Get.offAll( TabScreen(index: 0,));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ', style: Theme.of(context).textTheme.subtitle1,),
                    GestureDetector(
                      child:  Text(
                          ' Sign up',
                          style: TextStyle(color: Colors.blue,fontSize: 14),textScaleFactor: 1
                      ),
                      // onTap: () => Navigator.pushReplacementNamed(context, MyRoutes.signupRoute),
                    ),
                  ],
                ),
              ],
            ),
          ),),
        )




      )),
    );
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool callApi = false;
  bool valid = false;


  save() {
    print("abc");
    if (!_formKey.currentState!.validate()) {
      return valid = true;
    }
    if (callApi == false) {
      callApi = true;
      valid = false;
      register().then((value) => callApi=false);
    }
    //    .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data'))))
  }

  Future register() async {
    // print(usernameController.text);


    final body = json.encode({
      "customer": {
        "email": emailController.text,
        "firstname": firstNameController.text,
        "lastname": lastNameController.text
      },
      "password": passwordController.text
    });
    final headers = {"Content-Type": "application/json"};


    final result =
    await http.post(Uri.parse(registerUrl), body: body, headers: headers);
    final paras = jsonDecode(result.body);

    print(result.statusCode);
    if (result.statusCode == 200) {
      print("200 aaya h");

      print(result.body.replaceAll('"', ''));
      MySharedPreferences.localStorage?.setBool("isLogin", true);
      MySharedPreferences.localStorage?.setString("admin_token", "raacpe6hvuaghphmgct06td2lemfybdr");
      // MySharedPreferences.localStorage?.setString("user_token", result.body.replaceAll('"', ''));
      // getAdminToken();
      Get.offAll(LoginScreen(
        // index: 0,
      ));
    } else {
      print("200 to nhi aaya h");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect Username or Password")));
    }
  }
}
