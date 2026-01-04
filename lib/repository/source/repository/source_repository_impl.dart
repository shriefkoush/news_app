import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/repository/source/dataSource/source_offline_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import '../../../model/source_Response.dart';
import '../dataSource/source_remote_data_source.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceOfflineDataSource sourceOfflineDataSource;
  SourceRepositoryImpl(
      {required this.sourceRemoteDataSource,
      required this.sourceOfflineDataSource});
  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo: with internet => remote ds
      var sourceResponse = await sourceRemoteDataSource.getSource(categoryId);
      //TODO: save sources
      sourceOfflineDataSource.saveSources(sourceResponse);
      return sourceResponse;
    } else {
      //todo: without internet => offline ds
      var sourceResponse = await sourceOfflineDataSource.getSource(categoryId);
      return sourceResponse;
    }
  }
}
