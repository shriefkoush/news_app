import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/section_Drawer_Item.dart';
import 'package:news_app/ui/home/drawer/section_Drawer_Item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked ;
  HomeDrawer ({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "English",
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

      ],
    );
  }
}
