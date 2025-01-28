import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/ui/home/category/source_Name_Item.dart';
import 'package:news_app/ui/home/news/news_Widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;
  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                dividerColor: AppColors.transparentColor,
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              indicatorColor: Theme.of(context).indicatorColor,
              tabAlignment: TabAlignment.start,
              isScrollable:true ,
                tabs: widget.sourcesList.map((source) {
              return SourceNameItem(source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source));
            }).toList()),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex])),
          ],
        ));
  }
}
