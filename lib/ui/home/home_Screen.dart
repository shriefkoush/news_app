import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_Model.dart';
import 'package:news_app/ui/home/category/category_Details.dart';
import 'package:news_app/ui/home/category/category_Fragment.dart';
import 'package:news_app/ui/home/drawer/home_Drawer.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName =" homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text( selectedCategory == null ?"Home"  : selectedCategory!.title ,style: Theme.of(context).textTheme.headlineLarge,),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(
          onDrawerItemClicked : onDrawerItemClicked ,
        ),
      ),
      body :selectedCategory == null ?
          CategoryFragment(onViewAllClicked: onViewAllClicked):
          CategoryDetails(category: selectedCategory!,)
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked (CategoryModel newSelectedCategory){
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }
  void onDrawerItemClicked (){
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}