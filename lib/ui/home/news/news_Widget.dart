import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/ui/home/news/news_Item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "something went wrong",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
