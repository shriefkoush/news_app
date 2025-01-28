import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category_Model.dart';
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/ui/home/category/source_Tab_Widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "categoryDetails";
  CategoryModel category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}
class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          //todo : loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return  Center(
              child: Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          }
          //todo: server => responce (success, error)
          //todo : server => error

          if (snapshot.data == null || snapshot.data!.status != "ok") {
            return  Center(
              child: Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );

          }
          //todo : server => success

          var sourcesList = snapshot.data!.sources!;
          return SourceTabWidget(sourcesList: sourcesList);
        });
  }
}
