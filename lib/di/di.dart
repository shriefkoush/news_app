//todo: view model => object(repository)
//todo: repository=> object(data source)
//todo: data source => object(api manager)

import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/source/dataSource/source_offline_data_source.dart';
import 'package:news_app/repository/source/dataSource/source_offline_data_source_impl.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import '../repository/news/dataSource/news_remote_data_source.dart';
import '../repository/news/dataSource/news_remote_data_source_impl.dart';
import '../repository/news/repository/news_repository.dart';
import '../repository/news/repository/news_repository_impl.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(sourceRemoteDataSource: injectSourceRemoteDataSource(),
  sourceOfflineDataSource: injectSourceOfflineDataSource()
  );
}
 SourceOfflineDataSource injectSourceOfflineDataSource(){
  return SourceOfflineDataSourceImpl();
 }


SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}
ApiManager injectApiManager(){
  return ApiManager();

}NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
