import 'package:hive/hive.dart';
import 'package:http/http.dart' as box;
import 'package:news_app/model/source_Response.dart';
import 'package:news_app/repository/source/dataSource/source_offline_data_source.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourceResponse?> getSource(String categoryId) async{
    // TODO: implement getSource
    ///read data
   var box = await Hive.openBox("sourceTab");
   var sourceTab = box.get("tabs");
   return sourceTab;
  }

  @override
  void saveSources(SourceResponse? sourceResponse) async{
    // TODO: implement saveSources
    /// write data
   var box = await Hive.openBox("sourceTab");
   await box.put("tabs", sourceResponse);
   await box.close();
  }
}