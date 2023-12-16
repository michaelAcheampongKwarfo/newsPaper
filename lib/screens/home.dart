import 'package:flutter/material.dart';
import 'package:new_paper/widgets/app_colors.dart';
import 'package:new_paper/widgets/app_text.dart';
import 'package:new_paper/widgets/breaking_card.dart';
import 'package:new_paper/widgets/category_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_paper/widgets/trending_card.dart';
import 'package:new_paper/widgets/view_all_row.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    int activeIndex = 0;
    final Map categoryMap = {
      'Business': 'lib/images/business.png',
      'Entertainment': 'lib/images/entertainment.png',
      'General': 'lib/images/general.png',
      'Health': 'lib/images/health.png',
      'Sport': 'lib/images/sports.png'
    };
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: 'News',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            AppText(
              text: 'Paper',
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 25.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.1,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: categoryMap.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                      text: categoryMap.keys.elementAt(index),
                      imagePath: categoryMap.values.elementAt(index));
                },
              ),
            ),
            // view all
            ViewAllRow(text: 'Breaking News', onTap: () {}),
            // carouselSilder
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.3,
              child: CarouselSlider.builder(
                itemCount: categoryMap.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return BreakingCard(
                    imagePath: categoryMap.values.elementAt(itemIndex),
                    text: categoryMap.keys.elementAt(itemIndex),
                  );
                },
                options: CarouselOptions(
                    height: double.infinity,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: categoryMap.length,
              effect: const SwapEffect(
                dotHeight: 15.0,
                dotWidth: 15.0,
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.greyColor,
              ),
            ),
            // view all
            ViewAllRow(onTap: () {}, text: 'Treanding News'),
            // Trending tile
            SizedBox(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: categoryMap.length,
                itemBuilder: (context, index) {
                  return TrendingCard(
                      imagePath: categoryMap.values.elementAt(index),
                      title: categoryMap.keys.elementAt(index),
                      subTitle: categoryMap.keys.elementAt(index));
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
