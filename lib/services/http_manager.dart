// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:new_paper/services/article_model.dart';

class HttpManager {
  // http request for breaking news
  Future<List<ArticleModel>> fetchBreakingNews() async {
    String breakingUrl =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c7f28a42f94343c9b3b60496a0f6ac5f';
    List<ArticleModel> breakingNewsArticle = [];
    try {
      var response = await http.get(Uri.parse(breakingUrl));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['articles'] != null) {
          for (var eachData in jsonData['articles']) {
            breakingNewsArticle.add(ArticleModel.fromJson(eachData));
          }
          return breakingNewsArticle;
        }
      } else {
        print('Unexpected data format: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    return breakingNewsArticle;
  }

  // http request function for trending news
  Future<List<ArticleModel>> fetchTrendingNews() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print(formattedDate);
    String breakingUrl =
        'https://newsapi.org/v2/everything?q=trending&sortBy=publishedAt&apiKey=c7f28a42f94343c9b3b60496a0f6ac5f';
    List<ArticleModel> breakingNewsArticle = [];
    try {
      var response = await http.get(Uri.parse(breakingUrl));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['articles'] != null) {
          for (var eachData in jsonData['articles']) {
            breakingNewsArticle.add(ArticleModel.fromJson(eachData));
          }
          return breakingNewsArticle;
        }
      } else {
        print('Unexpected data format: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    return breakingNewsArticle;
  }

  // http request function for category news
  Future<List<ArticleModel>> fetchCategoryNews(String category) async {
    String breakingUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=c7f28a42f94343c9b3b60496a0f6ac5f';
    List<ArticleModel> breakingNewsArticle = [];
    try {
      var response = await http.get(Uri.parse(breakingUrl));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['articles'] != null) {
          for (var eachData in jsonData['articles']) {
            breakingNewsArticle.add(ArticleModel.fromJson(eachData));
          }
          return breakingNewsArticle;
        }
      } else {
        print('Unexpected data format: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    return breakingNewsArticle;
  }
}
