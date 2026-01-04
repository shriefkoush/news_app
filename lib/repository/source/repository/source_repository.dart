
import '../../../model/source_Response.dart';

abstract class SourceRepository{
  //todo: interface
  Future<SourceResponse?>getSource( String categoryId);
}