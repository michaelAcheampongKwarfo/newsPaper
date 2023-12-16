import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  const AppText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: 'Times New Roman',
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
