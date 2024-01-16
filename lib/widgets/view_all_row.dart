import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class ViewAllRow extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ViewAllRow({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.02,
        horizontal: screenSize.width * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: text,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
              onTap: onTap,
              child: const AppText(
                text: 'View All',
                color: AppColors.primaryColor,
              )),
        ],
      ),
    );
  }
}
