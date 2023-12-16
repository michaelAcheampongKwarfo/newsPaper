import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String imagePath;
  const CategoryCard({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 08.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          color: AppColors.secondBlackColor,
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              Center(
                child: AppText(
                  text: text,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
