import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_Details.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName =" homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :CategoryDetails(),
    );
  }
}