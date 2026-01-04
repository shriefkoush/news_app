import '../../../model/newsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse?> getNewsBySourceId(String sourceId, int page);
}