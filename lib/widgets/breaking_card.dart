import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class BreakingCard extends StatelessWidget {
  const BreakingCard({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.text,
  });

  final VoidCallback onTap;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: SizedBox(
              width: screenSize.width,
              height: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(screenSize.width * 0.01),
                      width: double.infinity,
                      height: screenSize.height * 0.1,
                      color: AppColors.secondBlackColor,
                      child: AppText(
                        text: text,
                        color: AppColors.whiteColor,
                        maxlines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
