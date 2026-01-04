import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/cubit/states/news_states.dart';
import 'package:news_app/ui/home/news/news_Item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel =
      NewsViewModel(newsRepository: injectNewsRepository());
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!, page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ));
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id!, page);
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < state.newsList.length) {
                  return NewsItem(news: state.newsList[index]);
                } else {
                  return Center(
                    child: TextButton(
                        onPressed: () {
                          ++page;
                          setState(() {});
                        },
                        child: Text(
                          "load more",
                          style: AppStyles.bold16white,
                        )),
                  );
                }
              },
              itemCount: state.newsList.length,
            );
          }
          return Container();
        });
    // FutureBuilder<NewsResponse?>(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? "", page),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting &&
    //         articles.isEmpty) {
    //       return Center(
    //           child: CircularProgressIndicator(
    //         color: AppColors.greyColor,
    //       ));
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(
    //               "something went wrong",
    //               style: Theme.of(context).textTheme.headlineLarge,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getNewsBySourceId(
    //                       widget.source.id ?? "", page);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try again"))
    //           ],
    //         ),
    //       );
    //     }
    //     if (snapshot.data!.status != 'ok') {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(
    //               snapshot.data!.message!,
    //               style: Theme.of(context).textTheme.headlineLarge,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getNewsBySourceId(
    //                       widget.source.id ?? "", page);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try again"))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data!.articles!;
    //     articles.addAll(newsList);
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         if (index < articles.length) {
    //           return NewsItem(news: articles[index]);
    //         } else {
    //           return Center(
    //             child: TextButton(
    //                 onPressed: () {
    //                   ++page;
    //                   setState(() {});
    //                 },
    //                 child: Text(
    //                   "load more",
    //                   style: AppStyles.bold16white,
    //                 )),
    //           );
    //         }
    //       },
    //       itemCount: articles.length + 1,
    //     );
    //   });
  }
}
