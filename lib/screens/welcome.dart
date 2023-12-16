import 'package:flutter/material.dart';
import 'package:new_paper/screens/home.dart';
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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.55,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset(
                  'lib/images/img1.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              text: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
