import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class TrendingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const TrendingCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      elevation: 3.0,
      child: Container(
        width: screenSize.width * 0.9,
        padding: EdgeInsets.all(screenSize.width * 0.01),
        margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // border: Border.all(
          //   color: AppColors.primaryColor,
          //   width: 0.8,
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                  width: screenSize.width * 0.2,
                  height: screenSize.height * 0.2,
                  color: AppColors.greyColor,
                  child: Image.asset(
                    imagePath,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  )),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: title,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      textOverflow: TextOverflow.ellipsis),
                  AppText(
                    text: subTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    textOverflow: TextOverflow.ellipsis,
                    color: AppColors.secondBlackColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
