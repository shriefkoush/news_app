import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/ui/home/category/cubit/states/source_States.dart';

class SourceViewModel extends Cubit<SourceState>{
   SourceRepository sourceRepository;

  SourceViewModel({required this.sourceRepository}) : super(SourceLoadingState());
  // todo: hold data - handle logic
void getSources(String categoryId)async{
  try{
    emit(SourceLoadingState());
    var response = await sourceRepository.getSource(categoryId);
    if(response!.status == "error"){
      emit(SourceErrorState(
          errorMessage: response.message!
      ));
    }
    else {
      emit(SourceSuccessState(sourcesList: response.sources!));
    }
  } catch(e){
    emit(SourceErrorState(errorMessage: e.toString()));
  }
}
}