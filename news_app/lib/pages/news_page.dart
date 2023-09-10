import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class NewsPage extends StatefulWidget {
  String title;
  NewsPage(this.title);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Categori> categories = [
    Categori("business", "Business"),
    Categori("entertainment", "Entertainment"),
    Categori("general", "General"),
    Categori("health", "Health"),
    Categori("science", "Science"),
    Categori("sports", "Sports"),
    Categori("technology", "Technology"),
  ];

  List<GestureDetector> getCategoriesTab(ArticleListViewModel vm) {
    List<GestureDetector> list = [];
    for (int i = 0; i < categories.length; i++) {
      list.add(
        GestureDetector(
          onTap: () => vm.getNews(categories[i].key, widget.title),
          child: Card(child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(categories[i].value,style: TextStyle(fontSize: 16),),
          )),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: getCategoriesTab(vm),
              ),
            ),
            vm.status.index == 2
                ? Expanded(
                  child: ListView.builder(
                      itemCount: vm.viewModel.articles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Image.network(vm
                                      .viewModel.articles[index].urlToImage ??
                                  "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg"),
                              ListTile(
                                title: Text(
                                  vm.viewModel.articles[index].title ?? '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    vm.viewModel.articles[index].description ??
                                        ''),
                              ),
                              ButtonBar(
                                children: [
                                  MaterialButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                          vm.viewModel.articles[index].url ??
                                              ''));
                                    },
                                    child: Text(
                                      "Go To News",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ));
  }
}
