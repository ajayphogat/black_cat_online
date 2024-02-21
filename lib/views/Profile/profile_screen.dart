import 'package:black_cat_online/provider/all_product_provider.dart';
import 'package:black_cat_online/utils/app_color.dart';
import 'package:black_cat_online/utils/my_shared_preference.dart';
import 'package:black_cat_online/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  // TextEditingController nameController = TextEditingController();

 Object a =[];
  @override
  void initState() {
    getSharePrefValue();
    super.initState();
  }



  getSharePrefValue()async {
    nameController.text =  MySharedPreferences.localStorage?.getString(MySharedPreferences.firstName) ?? "";
    emailController.text =  MySharedPreferences.localStorage?.getString(MySharedPreferences.email) ?? "";
    mobilController.text =  MySharedPreferences.localStorage?.getString(MySharedPreferences.mobile) ?? "";
   // a =  MySharedPreferences.localStorage?.getStringList(MySharedPreferences.street) ?? "" ;

   print(a);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headline4,
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          // actions: [
          //   Icon(
          //     Icons.home,
          //     size: 30,
          //   ),
          //   SizedBox(width: 15),
          // ],
        ),
        body: SafeArea(
          child: Consumer<ProfileProvider>(
            builder: (context, value, child) => ListView(
              children: [
                Container(
                  height: height*.165,
                  color: Colors.black,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       image: NetworkImage(
                  //           "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/800px-A_black_image.jpg?20201103073518"),
                  //       fit: BoxFit.cover),
                  // ),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: Container(
                      alignment: Alignment(0.0, 4.5),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://contentgather.com/storage/profile_pictures/24512_604767.jpg"),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "${value.profileModel?.firstname} ${value.profileModel?.lastname}",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(thickness: 2),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: new EdgeInsets.only(
                    right: 5.0,
                    left: 5.0,
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.all(2.0),
                            hintText: 'Name',
                            hintStyle: TextStyle(fontSize: 18),
                            icon: Icon(
                              Icons.person,
                              color: AppColors.black,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: mobilController,
                          validator: (value) {
                            if (!isPhone(value!)) {
                              return 'Please enter a valid phone no.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.all(2.0),
                            hintText: 'Phone No',
                            hintStyle: TextStyle(fontSize: 18),
                            icon: Icon(
                              Icons.phone,
                              color: AppColors.black,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          enabled: false,
                          controller: emailController,
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.all(2.0),
                            hintText: 'Email Id',
                            hintStyle: TextStyle(fontSize: 18),
                            icon: Icon(
                              Icons.email,
                              color: AppColors.black,
                            ),
                          ),
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
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.all(2.0),
                            hintText: 'Address',
                            hintStyle: TextStyle(fontSize: 18),
                            icon: Icon(
                              Icons.location_pin,
                              color: AppColors.black,
                            ),
                          ),
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.center,
                          child: MyButton(
                            width: width * .95,
                            height: width * .11,
                            title: "EDIT PROFILE",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
// String? validateEmail(String? value) {
//   String pattern =
//       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?)*$";
//   RegExp regex = RegExp(pattern);
//   if (value == null || value.isEmpty || !regex.hasMatch(value))
//     return 'Enter a valid email address';
//   else
//     return null;
// }
}
