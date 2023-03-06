import 'package:apinew/models/NewsDataModel.dart';
import 'package:apinew/models/sources_response.dart';
import 'repository.dart';

class LocalData implements BaseRepository{
  @override
  Future<NewsDataModel> getNewsData(String? sourceID,{String? query}) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}