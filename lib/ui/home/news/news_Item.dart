import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/newsResponse.dart';

class NewsItem extends StatefulWidget {
 News news;
 NewsItem ({required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        showArticleDetailsBottomSheet(context,widget.news);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.01
        ),
        padding: EdgeInsets.symmetric(
            horizontal: width*0.02,
            vertical: height*0.01
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Theme.of(context).indicatorColor,
        width: 2)
        ),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              height: height*0.25,
              imageUrl: widget.news.urlToImage??"",
              placeholder: (context, url) => Center(child:
              CircularProgressIndicator(
                color: AppColors.greyColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height*0.02,),
          Text(widget.news.title??"",
            style: Theme.of(context).textTheme.labelLarge ,),
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [
            Expanded(
              child: Text('By :${widget.news.author??""}',
                  style: AppStyles.medium12grey,),
            ),
            Text(widget.news.publishedAt?.substring(0,10)??"",
                style: AppStyles.medium12grey,),
          ],)
        ],),
      ),
    );
  }

  void showArticleDetailsBottomSheet(BuildContext context, News news) {
    showModalBottomSheet( 
      backgroundColor: AppColors.transparentColor,
        isScrollControlled: true,
        isDismissible: true,
        context: context, builder: (context){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Theme.of(context).indicatorColor,
                  width: 2),
            color: AppColors.whiteColor
          ),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                imageUrl: news.urlToImage??"",
                placeholder: (context, url) => Center(child:
                CircularProgressIndicator(
                  color: AppColors.greyColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
           const SizedBox(height: 16,),
            Text(news.description??"",
              style: AppStyles.medium14black,),
            const SizedBox(height: 16,),
            FilledButton(onPressed: (){
              launchUrl(
                Uri.parse(news.url?? ""),
                mode: LaunchMode.inAppWebView,
              );
            },
              style: FilledButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: AppColors.blackColor,
                foregroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("View Full Article",style: AppStyles.bold16white,),
                  ],
                ),
            )
          ],),
        ),
      ],);
    });
  }
}
