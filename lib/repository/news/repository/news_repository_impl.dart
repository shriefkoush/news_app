import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
 Future<NewsResponse?> getNewsBySourceId(String sourceId, int page)async {
    // TODO: implement getNewsBySourceId
   var response = await newsRemoteDataSource.getNewsBySourceId(sourceId, page);
   return response;
  }

}