import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:apinew/models/NewsDataModel.dart';
import 'package:apinew/models/sources_response.dart';
import 'repository.dart';

class ApiManager{
  static const String BASE='newsapi.org';
  static const String APIKEY='80918740da1644c691823b2fc3398187';
  BaseRepository? baseRepository;

  ApiManager({this.baseRepository});


}