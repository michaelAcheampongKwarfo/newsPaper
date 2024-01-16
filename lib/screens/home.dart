import 'package:flutter/material.dart';
import 'package:new_paper/screens/breaking.dart';
import 'package:new_paper/screens/category.dart';
import 'package:new_paper/screens/web_view.dart';
import 'package:new_paper/screens/trending.dart';
import 'package:new_paper/services/article_model.dart';
import 'package:new_paper/services/http_manager.dart';
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
  ValueNotifier<int> activeIndexNotifier = ValueNotifier<int>(0);
  final HttpManager _httpManager = HttpManager();
  List<ArticleModel> breakingNewsList = [];
  List<ArticleModel> trendingNewsList = [];

  Future<void> getDataFromHttpManager() async {
    await Future.wait([
      _httpManager
          .fetchBreakingNews()
          .then((value) => breakingNewsList = value),
      _httpManager
          .fetchTrendingNews()
          .then((value) => trendingNewsList = value),
    ]);
  }

  @override
  void initState() {
    super.initState();
    getDataFromHttpManager();
  }

  final Map categoryMap = {
    'Business': 'lib/images/business.png',
    'Entertainment': 'lib/images/entertainment.png',
    'Health': 'lib/images/health.png',
    'Technology': 'lib/images/technology.png',
    'Sport': 'lib/images/sports.png',
    'Politics': 'lib/images/politics.png',
    'Science': 'lib/images/science.png',
    // 'Education': 'lib/images/education.png',
    // 'Environment': 'lib/images/environment.png'
  };
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
      body: FutureBuilder(
        future: getDataFromHttpManager(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return AppText(text: 'Error: ${snapshot.error}');
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
              child: Column(
                children: [
                  // Category Section
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
                          imagePath: categoryMap.values.elementAt(index),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  title: '${categoryMap.keys.elementAt(index)}',
                                  category: categoryMap.keys
                                      .elementAt(index)
                                      .toString()
                                      .toLowerCase(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Breaking New - view all
                  ViewAllRow(
                      text: 'Breaking News',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BreakingScreen(title: 'Breaking News'),
                          ),
                        );
                      }),
                  // CarouselSlider
                  SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 0.3,
                    child: CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return BreakingCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebView(
                                  url: trendingNewsList[itemIndex].url,
                                ),
                              ),
                            );
                          },
                          imagePath: breakingNewsList[itemIndex].urlToImage,
                          text: breakingNewsList[itemIndex].title,
                        );
                      },
                      options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (index, reason) {
                            activeIndexNotifier.value = index;
                          }),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: activeIndexNotifier,
                    builder: (context, value, child) {
                      return AnimatedSmoothIndicator(
                        activeIndex: value,
                        count: 3,
                        effect: const SwapEffect(
                          dotHeight: 15.0,
                          dotWidth: 15.0,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: AppColors.greyColor,
                        ),
                      );
                    },
                  ),
                  // Trending News - view all
                  ViewAllRow(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TrendingScreen(title: 'Trending News'),
                          ),
                        );
                      },
                      text: 'Trending News'),
                  // Trending tile
                  SizedBox(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return TrendingCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebView(
                                  url: trendingNewsList[index].url,
                                ),
                              ),
                            );
                          },
                          imagePath: trendingNewsList[index].urlToImage,
                          title: trendingNewsList[index].title,
                          subTitle: trendingNewsList[index].description,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
