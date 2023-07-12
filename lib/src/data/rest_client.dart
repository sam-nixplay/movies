import 'package:dio/dio.dart';
import 'package:movies/src/data/entities/movies_list.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/search/movie")
  Future<MoviesList> getMovies(
    @Query("query") String query,
    @Query("page") int page,
  );
}
