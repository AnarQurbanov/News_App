import '../models/articles.dart';

class ArticleViewModel{
  String category;
  String country;
  List<Articles> articles;
  ArticleViewModel(this.category, this.country, this.articles);
}