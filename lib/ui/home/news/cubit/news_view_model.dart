import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/ui/home/news/cubit/states/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  int page = 1;
  //todo: hold data _ handle logic
  void getNewsBySourceId(String sourceId, int page) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId, page);
      if (response!.status == "error") {
        emit(NewsErrorState(errorMessage: response.message!));
      } else {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
