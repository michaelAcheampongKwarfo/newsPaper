import 'package:flutter/material.dart';
import 'package:new_paper/screens/web_view.dart';
import 'package:new_paper/services/article_model.dart';
import 'package:new_paper/services/http_manager.dart';
import 'package:new_paper/widgets/app_text.dart';
import 'package:new_paper/widgets/blog_card.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  final String category;
  const CategoryScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final HttpManager _httpManager = HttpManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: widget.title,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: StreamBuilder<List<ArticleModel>>(
        stream: _httpManager.fetchCategoryNews(widget.category).asStream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return BlogCard(
                    imagePath: snapshot.data![index].urlToImage,
                    title: snapshot.data![index].title,
                    description: snapshot.data![index].description,
                    publishedAt: snapshot.data![index].publishedAt,
                    message: snapshot.data![index].title,
                    link: snapshot.data![index].url,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            url: snapshot.data![index].url,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}
