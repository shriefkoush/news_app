import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/source_Response.dart';
class ApiManager{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=1298eefcf3444399a2c69c1fd3dc3fd3

static Future<SourceResponse?> getSources()async{
  Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{
    "apikey" : ApiConstants.apikey
  });
  try {
    var response = await http.get(url);

    var responseBody = response.body; //String
    var json = jsonDecode(responseBody); //json
    SourceResponse.fromJson(json); //object
  }catch(e){
    throw e ;
  }

 }
}