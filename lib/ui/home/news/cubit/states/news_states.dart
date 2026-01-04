import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/source_Response.dart';

class NewsState{}
class NewsLoadingState extends NewsState{}
class NewsErrorState extends NewsState{
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsState{
  final List<News> newsList;
  final bool? hasMore ;
  NewsSuccessState({required this.newsList,this.hasMore});
}
class NewsInitialState extends NewsState{}
