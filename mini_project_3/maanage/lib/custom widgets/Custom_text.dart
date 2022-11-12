import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({required this.text,
   this.textcolor,
   this.fontWeight,
   this.textAlign,
   this.FontFamily,
   this.fontSize,
   Key?key
    }):super(key:key);
String text;
Color? textcolor;
FontWeight? fontWeight;
TextAlign ? textAlign;
String? FontFamily;
double ? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color:textcolor ?? Colors.black,fontWeight: fontWeight,fontFamily: FontFamily ,fontSize:fontSize  ),textAlign: textAlign,);
  }
}