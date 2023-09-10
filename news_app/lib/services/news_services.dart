import 'package:news_app/models/articles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/models/news.dart';

class NewsServices{
  Future<List<Articles>?> fetchNews(String category,String country) async{
    String url = "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=0bd1680190c74364b064eae0a89882b3";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      final results = json.decode(response.body);
      News news = News.fromJson(results);
      return news.articles ?? []; //Null ise bos liste don
    }
    throw Exception("Bad Request");
  }
}