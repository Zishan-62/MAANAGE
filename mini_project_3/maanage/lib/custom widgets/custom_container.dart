import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({
    this.padding,
    required this.Child,
    this.bgcolor,
    this.height,
    this.width,
    this.radius,
    Key?key}):super(key:key);

EdgeInsets? padding;
Widget Child;
Color ?bgcolor;
double? height;
double?width;
double?radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius??0)),
      color: bgcolor??Colors.white,
      padding: padding,child: Child,);
  }
}