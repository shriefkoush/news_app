import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_Details.dart';
import 'package:news_app/ui/home/category/category_Fragment.dart';
import 'package:news_app/ui/home/drawer/section_Drawer.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName =" homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: Theme.of(context).textTheme.headlineLarge,),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: SectionDrawer(),
      ),
      body :CategoryFragment(),
    );
  }
}