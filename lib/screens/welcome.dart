import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_button.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.6,
                child: Image.asset(
                  'lib/images/img1.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            const AppText(
              text: 'News from around the\nworld for you',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            const AppText(
              text:
                  'Best time to read, take your time to read\na little more of this world',
              fontWeight: FontWeight.bold,
              color: AppColors.secondBlackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            AppButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              text: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
