import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';
import 'package:share_plus/share_plus.dart';

class BlogCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String publishedAt;
  final String message;
  final String link;

  final VoidCallback onTap;

  const BlogCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.onTap,
    required this.message,
    required this.link,
  });

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.whiteColor,
        child: GestureDetector(
          onTap: widget.onTap,
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    widget.imagePath,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: screenSize.height * 0.2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.01,
                    horizontal: screenSize.width * 0.01,
                  ),
                  child: AppText(
                    text: widget.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    maxlines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.01,
                  ),
                  child: AppText(
                    text: widget.description,
                    color: AppColors.secondBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    textOverflow: TextOverflow.ellipsis,
                    maxlines: 3,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: DateFormat('yyyy-MM-dd – kk:mm')
                            .format(DateTime.parse(widget.publishedAt)),
                        fontSize: 15.0,
                      ),
                      IconButton(
                          onPressed: () {
                            Share.share('${widget.message} ${widget.link}');
                          },
                          icon: const Icon(
                            Icons.share_outlined,
                            color: AppColors.blackColor,
                          ))
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
