import 'package:apinew/models/NewsDataModel.dart';
import 'package:apinew/models/sources_response.dart';

abstract class BaseRepository{

  Future<SourcesResponse> getSources(String categoryId);
  Future<NewsDataModel> getNewsData(String? sourceID,{String? query});
}