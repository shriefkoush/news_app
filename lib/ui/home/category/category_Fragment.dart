import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_Model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  //var categoriesList = CategoryModel.getCategoriesList(true);
  List <CategoryModel> categoriesList = [];
  @override
  Widget build(BuildContext context) {
    categoriesList = CategoryModel.getCategoriesList(false);
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(" Good Morning\n Here is Some News For You",style:
            Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: height*0.01,),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: Stack(
                    alignment: index %2 ==0 ? Alignment.bottomRight :
                    Alignment.bottomLeft
                    ,
                    children: [
                    ClipRRect(borderRadius: BorderRadius.circular(24),
                        child: Image.asset(categoriesList[index].imagePath)),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: width*0.02 ,
                        vertical: height* 0.02,
                      ),
                      child: ToggleSwitch(
                        customWidths: [width*0.25,width*0.15],
                        customWidgets: [
                          Row(children: [
                            Text("View All",style: Theme.of(context).textTheme.headlineLarge,)
                          ],),
                          CircleAvatar(backgroundColor:
                            Theme.of(context).primaryColor,
                            child: Icon(Icons.arrow_forward_ios_rounded,
                              color:Theme.of(context).indicatorColor ,
                            size: 20,),
                          )
                        ],
                        cornerRadius: 30.0,
                        activeBgColors:[
                        [AppColors.greyColor],
                          [AppColors.greyColor],
                        ],
                        inactiveBgColor:AppColors.greyColor,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        radiusStyle: true,
                        animate: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ),

                  ],),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: height*0.02,);
              },
              itemCount: categoriesList.length))
        ],
      ),
    );
  }
}
