import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class BlogScreen extends StatefulWidget {
  final String title;
  const BlogScreen({super.key, required this.title});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: widget.title,
          color: AppColors.primaryColor,
        ),
      ),
      body: Column(children: [],),
    );
  }
}
