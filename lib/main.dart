import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_Details.dart';
import 'package:news_app/ui/home/home_Screen.dart';
import 'package:news_app/utils/app_theme.dart';

void main() {
  runApp( news_app());
}

class news_app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName : (context)=> HomeScreen(),
        CategoryDetails.routeName : (context)=> CategoryDetails(),
      },
      theme:AppTheme.lightTheme ,
      darkTheme:AppTheme.darkTheme,
      themeMode: ThemeMode.light,


    );
  }
}