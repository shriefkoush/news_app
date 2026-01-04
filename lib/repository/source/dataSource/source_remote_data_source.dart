
import '../../../model/source_Response.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSource(String categoryId);
}