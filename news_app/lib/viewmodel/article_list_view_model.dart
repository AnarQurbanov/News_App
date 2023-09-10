import 'package:flutter/widgets.dart';
import 'package:news_app/services/news_services.dart';
import 'article_view_model.dart';

enum Status{
    initial,
    loading,
    loaded,
}

class ArticleListViewModel extends ChangeNotifier{
    ArticleViewModel viewModel = ArticleViewModel('business','us',[]);
    Status status = Status.initial;

    ArticleListViewModel(String title){
      getNews('business',title);
    }

    Future<void> getNews(String category,String country) async{
      status  = Status.loading;
      notifyListeners(); //dinleyenleri bilgilendir
      viewModel.articles = await NewsServices().fetchNews(category,country) ?? [];
      status = Status.loaded;
      notifyListeners();

    }
}