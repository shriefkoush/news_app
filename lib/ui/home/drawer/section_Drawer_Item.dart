import 'package:flutter/cupertino.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath ;
  String text ;
  SectionDrawerItem({required this.imagePath ,required this.text});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        ImageIcon(AssetImage(imagePath),color: AppColors.whiteColor,),
        SizedBox(width: width*0.02,),
        Text(text,style: AppStyles.bold20white,)
      ],),
    );
  }
}
