
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormWidget extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Widget? sufixIcon;
  final Widget? prifixIcon;
  final TextEditingController controller;
  final  bool obscureText  ;
  final  bool enable  ;
  final  int maxLines  ;
  final String? Function(String?)? validator;
  final Function? onChanged;
  final TextInputType? keyBoardType;

  const MyTextFormWidget(
      {Key? key, required this.hintText, this.sufixIcon,  this.prifixIcon, required this.controller,
        this.obscureText = false, this.enable=true, this.labelText, this.maxLines = 1, this.validator, this.keyBoardType, this.onChanged,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLines: 1,
          enabled: enable,

          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            hoverColor: Colors.grey,
            fillColor: Colors.white,
            filled: true,
            focusColor: Colors.grey,
            border: InputBorder.none,
            suffixIcon: sufixIcon,
            prefixIcon:prifixIcon,
            // prefixIcon: Icon(prifixIcom,color: Colors.blueGrey,),
            // prefixStyle: TextStyle(color: Colors.orange),
            hintText: hintText,
            labelText: labelText,
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                // borderRadius: BorderRadius.circular(30.0)
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              // borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              // borderRadius: BorderRadius.circular(30.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              // borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          validator: validator,
          onChanged: (value) {

          },
        ),
      ],
    );
  }
}
