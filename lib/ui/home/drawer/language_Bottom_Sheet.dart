import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_Language_Provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              languageProvider.changeLanguage("en");
            },
            child: languageProvider.appLanguage == "en" ?
                getSelectedItemWidget(("English")):
                getUnSelectedItemWidget("English")
          ),
          SizedBox(height: height*0.02,),
          InkWell(
            onTap: (){
              languageProvider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                languageProvider.appLanguage == "ar"?
                    getSelectedItemWidget("Arabic"):
                    getUnSelectedItemWidget("Arabic")
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getSelectedItemWidget(String text ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: AppStyles.bold22black,),
        Icon(Icons.check,size: 35,color: AppColors.blackColor,),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return  Text(text,style: AppStyles.bold20black,);

  }
}
