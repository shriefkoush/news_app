import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

import '../../../model/newsResponse.dart';

class NewsItem extends StatelessWidget {
 News news;
 NewsItem ({required this.news});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
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
            imageUrl: news.urlToImage??"",
            placeholder: (context, url) => Center(child:
            CircularProgressIndicator(
              color: AppColors.greyColor,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: height*0.02,),
        Text(news.title??"",
          style: Theme.of(context).textTheme.labelLarge ,),
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          children: [
          Expanded(
            child: Text('By :${news.author??""}',
                style: AppStyles.medium12grey,),
          ),
          Text(news.publishedAt?.substring(0,10)??"",
              style: AppStyles.medium12grey,),
        ],)
      ],),
    );
  }
}
