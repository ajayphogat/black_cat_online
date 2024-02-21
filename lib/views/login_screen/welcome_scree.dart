import 'package:black_cat_online/utils/my_theme.dart';
import 'package:black_cat_online/views/login_screen/login_screen.dart';
import 'package:black_cat_online/views/login_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:
          Center( child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset( "assets/images/logo.PNG",),
                SizedBox(height: 25,),
                Text("Welcome to BlackCat Online",style: Theme.of(context).textTheme.headline6,),
                SizedBox(height: 10,),
                // Text("Welcome to BlackCat Online",style: Themes.of(context).textTheme.bodyText1,),
                // SizedBox(height: 25,),
                Row(mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Container(
                        width: width * .3,
                        height: width * .1,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black),
                          borderRadius: BorderRadius.circular(5),
                            color: AppColors.black

                        ),
                        child: Center(
                          child: Text("Sign In",style: Theme.of(context).textTheme.bodyText2,),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: Container(
                        width: width * .3,
                        height: width * .1,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text("Sign Up",style: Theme.of(context).textTheme.bodyText1,),
                        ),
                      ),
                    )
                  ],
                )



              ],
            )
          ),

        ),
      ),
    );
  }
}
