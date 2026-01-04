import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
 Future<NewsResponse?> getNewsBySourceId(String sourceId , int page) async{
    // TODO: implement getNewsBySourceId
   var response = await apiManager.getNewsBySourceId(sourceId, page);
   return response;
  }

}