//we created a seperated class t o handle network request
// we check the package to perform operation (network call,api call,server  request/response)
// http:https://pub.dev/packages/http
// dio: https://pub.dev/packages/dio/install
// api:

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/app_urls.dart';
import 'package:news_app/feature/news/data/news_model.dart';

class NetworkRequest{
  final dio = Dio();

   Future<List<Articles>?> getTopNews() async {
    final response= await dio.get(AppUrls.apiNews);
    // print('server response data :${response.data['articles']}');
    // print('server response code :${response.statusCode}');
    return NewsModel.fromJson(response.data).articles;
  }
  Future<List<Articles>?> getEntertainmentNews() async {
    final response= await dio.get(AppUrls.apiEntertainment);
    // print('server response data :${response.data['articles']}');
    // print('server response code :${response.statusCode}');
    return NewsModel.fromJson(response.data).articles;
  }
  Future<List<Articles>?> getSportsNews() async {
     final response=await dio.get(AppUrls.apiSport);
     return NewsModel.fromJson(response.data).articles;
  }


}