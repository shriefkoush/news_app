
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';

import '../../../api/api_manager.dart';
import '../../../model/source_Response.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
 Future<SourceResponse?> getSource(String categoryId) async{
    // TODO: implement getSource
   var response = await apiManager.getSources(categoryId);
   return response;
  }

}