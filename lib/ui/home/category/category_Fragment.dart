import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Text("Good Morning\n Here is Some News For You",style:
            Theme.of(context).textTheme.headlineMedium,),
          Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return Container();
              },
              separatorBuilder: (context,index){
                return SizedBox(height: height*0.02,);
              },
              itemCount: 8))
        ],
      ),
    );
  }
}
