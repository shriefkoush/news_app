import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/source_Response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.sourceApi,
      {
        "apiKey": ApiConstants.apikey,
        "category":categoryId ,
      },
    );

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseBody = response.body; // JSON string
        var json = jsonDecode(responseBody); // JSON object
        return SourceResponse.fromJson(json); // Return SourceResponse object
      } else {
        // Handle HTTP error response
        return SourceResponse(
          status: "error",
          message: "Failed to load sources. Error code: ${response.statusCode}",
        );
      }
    } catch (e) {
      // Handle any exception during the request
      return SourceResponse(
        status: "error",
        message: "An error occurred: $e",
      );
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=1298eefcf3444399a2c69c1fd3dc3fd3
    Uri url =Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,{
      "apiKey" : ApiConstants.apikey,
      "sources" : sourceId
    });
    try{
      var responce = await http.get(url);
      var responceBody = responce.body;
      var json = jsonDecode(responceBody);
      return NewsResponse.fromJson(json);
    }catch (e){
      throw e ;
    }
  }
}