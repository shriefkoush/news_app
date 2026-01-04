import '../../../model/source_Response.dart';

abstract class SourceOfflineDataSource{
  Future<SourceResponse?> getSource(String categoryId);

  void saveSources(SourceResponse? sourceResponse);
}