import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class BlogCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String publishedAt;
  final VoidCallback onTap;
  const BlogCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(12.0),
      color: AppColors.whiteColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: screenSize.width,
          height: screenSize.height * 0.3,
          padding: EdgeInsets.all(screenSize.width * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imagePath,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: screenSize.height * 0.2,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                child: AppText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                child: AppText(
                  text: description,
                  color: AppColors.secondBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.blackColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: AppColors.blackColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
