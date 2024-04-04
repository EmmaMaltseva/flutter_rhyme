import 'package:dio/dio.dart';
import 'package:flutter_project/api/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String baseUrl}) = _RhymerApiClient;

  @GET('/rhymes/get')
  Future<List<Rhymes>> getRhymeslist(@Query('word') String word);
}
