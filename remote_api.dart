import 'dart:convert';

import 'package:http/http.dart';
import 'package:apinew/models/NewsDataModel.dart';
import 'package:apinew/models/sources_response.dart';
import 'package:apinew/repository.dart';
import 'package:http/http.dart' as http;



class RemoteApi implements BaseRepository{
  static const String BASE='newsapi.org';
  static const String APIKEY='80918740da1644c691823b2fc3398187';
  @override
  Future<NewsDataModel> getNewsData(String? sourceID,{String? query}) async{
    Uri URL=Uri.https(BASE, '/v2/everything',{
      "apiKey":APIKEY,
      "sources":sourceID,
      "q":query,
    });

    Response response= await   http.get(URL);
    var json=jsonDecode(response.body);
    NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<SourcesResponse> getSources(String categoryId)async {
    Uri URL=Uri.https(BASE, '/v2/top-headlines/sources',
        {"apiKey":APIKEY,"category":categoryId});
    Response response=await http.get(URL);

    try{
      var json=jsonDecode(response.body);
      SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(e){
      print(e);
      throw e;
    }
  }

}