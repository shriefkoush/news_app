import 'package:flutter/material.dart';
import 'package:news_app/providers/app_Language_Provider.dart';
import 'package:news_app/providers/app_Theme_Provider.dart';
import 'package:news_app/ui/home/drawer/section_Drawer_Item.dart';
import 'package:news_app/ui/home/drawer/section_Drawer_Item.dart';
import 'package:news_app/ui/home/drawer/theme_Bottom_Sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';
import 'package:provider/provider.dart';

import 'language_Bottom_Sheet.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked ;
  HomeDrawer ({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          height: height * 0.18,
          width: double.infinity,
          child: Center(
              child: Text(
            "News App",
            style: AppStyles.bold24black,
          )),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: (){
            // todo: go to home
            onDrawerItemClicked();
          },
          child: SectionDrawerItem(
            imagePath: AssetsManager.homeIcon,
            text: "Go To Home",
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SectionDrawerItem(
          imagePath: AssetsManager.themeIcon,
          text: "Theme",
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor)),
          child: InkWell(
            onTap: (){
              showThemeBottomSheet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeProvider.appTheme == ThemeMode.light?
                  "Light":
                  "Dark",
                  style: AppStyles.medium20white,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.06,
          endIndent: width * 0.06,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SectionDrawerItem(
          imagePath: AssetsManager.languageIcon,
          text: "Language",
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor)),
          child: InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageProvider.appLanguage == "en"?
                  "English" :
                      "Arabic",
                  style: AppStyles.medium20white,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,
                )
              ],
            ),
          ),
        ),

      ],
    );
  }

  void showThemeBottomSheet(context) {
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(context: context, builder: (context)=>LanguageBottomSheet());
  }
}
