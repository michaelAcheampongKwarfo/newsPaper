import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? size;
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: size ?? screenSize.width * 0.7,
          padding: EdgeInsets.all(screenSize.width * 0.03),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: AppText(
              text: text,
              color: AppColors.whiteColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
