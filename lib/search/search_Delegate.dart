import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/ui/home/news/news_Item.dart';

import '../api/api_manager.dart';
import '../model/newsResponse.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class NewsSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: ()=> showResults(context), icon: const Icon(Icons.search,size: 30,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon:const Icon(Icons.close,size: 30,) );
  }


  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          "No News Yet",
          style: AppStyles.bold16white,
        ),
      );
    }

    return FutureBuilder<NewsResponse?>(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Something went wrong",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                   ApiManager.searchNews(query);
                  },
                  child: Text("Try again"),
                )
              ],
            ),
          );
        }

        final newsData = snapshot.data;
        if (newsData == null) {
          return Center(
            child: Text(
              "No data received",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
        }

        if (newsData.status != 'ok') {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  newsData.message ?? "Unknown error",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    ApiManager.searchNews(query);
                  },
                  child: Text("Try again", style: AppStyles.bold16black),
                ),
              ],
            ),
          );
        }

        final articles = newsData.articles;
        if (articles == null || articles.isEmpty) {
          return Center(
            child: Text(
              "Not found",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: NewsItem(news: articles[index]),
              onTap: () {},
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }

  // ThemeData appBarTheme(BuildContext context){
  //   return ThemeData(
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: AppColors.blackColor
  //     ),
  //   );
  }

