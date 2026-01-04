import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/category_Model.dart';

import 'package:news_app/ui/home/category/source_Tab_Widget.dart';
import 'package:news_app/utils/app_colors.dart';

import 'cubit/sourceViewModel.dart';
import 'cubit/states/source_States.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "categoryDetails";
  CategoryModel category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();

}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = SourceViewModel(sourceRepository: injectSourceRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
      if (state is SourceLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.greyColor,
          ),
        );
      } else if (state is SourceErrorState) {
        return Center(
          child: Column(
            children: [
              Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text("Try again"))
            ],
          ),
        );
      } else if (state is SourceSuccessState) {
        return SourceTabWidget(sourcesList: state.sourcesList);
      }
      return Container();
    });
  }
}
