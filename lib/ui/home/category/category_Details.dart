import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "categoryDetails";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          //todo : loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });

                },
                    child: Text("Try again"))
              ],
            );
          }
          //todo: server => responce (success, error)
          //todo : server => error

          if (snapshot.data!.status != "ok") {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                setState(() {

                });
                  },
                    child: Text("Try again"))
              ],
            );
          }
          //todo : server => success
          var sourcesList = snapshot.data!.sources!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(sourcesList[index].name??'');
            },
            itemCount: sourcesList.length,
          );
        });
  }
}
