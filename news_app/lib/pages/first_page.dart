import 'package:flutter/material.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:provider/provider.dart';

import '../viewmodel/article_list_view_model.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("News")),
      ),
      body: ListView(
        children: [
          buton(context, width, height, "Turkey", "tr"),
          buton(context, width, height, "United Kingdom", "gb"),
          buton(context, width, height, "USA", "us"),
          buton(context, width, height, "Canada", "ca"),
          buton(context, width, height, "Russia", "ru"),
          buton(context, width, height, "Germany", "de"),
          buton(context, width, height, "France", "fr"),
          buton(context, width, height, "İtaly", "it"),
          buton(context, width, height, "Saudi Arabia", "sa"),
          buton(context, width, height, "Japan", "jp"),
          buton(context, width, height, "South Korea", "kr"),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget buton(BuildContext context, double width, double height,
      String country, String title) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChangeNotifierProvider(
              create: (context) => ArticleListViewModel(title),
              child: NewsPage(title),
            );
          }));
        },
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width / 8, 0, width / 8, 0),
              child: Container(
                height: height / 8,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    country,
                    style: TextStyle(fontSize: height / 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
