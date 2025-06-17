part of '../data_sources.dart';

@RestApi()
abstract class CharactersRemoteDataSource {
  factory CharactersRemoteDataSource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _CharactersRemoteDataSource;

  @GET(DataSourcesEndpoints.characters)
  Future<CharactersListDTO> getAllCharacters(@http.Query('page') int page);
}
