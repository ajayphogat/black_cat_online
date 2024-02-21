import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final Color? bgColor;

  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.textColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            textStyle: style ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),


        ),
      ),
    );
  }
}
