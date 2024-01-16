import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class TrendingCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String title;
  final String subTitle;
  const TrendingCard(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 10.0,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
          child: Container(
            width: screenSize.width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: screenSize.width * 0.3,
                    height: screenSize.height * 0.2,
                    color: AppColors.greyColor,
                    child: Image.network(
                      imagePath,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        text: title,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        textOverflow: TextOverflow.ellipsis,
                        maxlines: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenSize.width * 0.01,
                        ),
                        child: AppText(
                          text: subTitle,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          textOverflow: TextOverflow.ellipsis,
                          maxlines: 2,
                          color: AppColors.secondBlackColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
