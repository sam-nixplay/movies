import 'package:dio/dio.dart';
import 'package:movies/src/data/entities/movies_list.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// REST client for accessing movie-related APIs.
///
/// The [RestClient] class is used to make HTTP requests to the movie API provided by The Movie Database (TMDb).
/// It supports various operations related to movies, such as searching for movies based on a query string and page number.
///
/// Example usage:
/// ```dart
/// Dio dio = Dio(); // Create a Dio instance for making HTTP requests
/// RestClient client = RestClient(dio); // Create an instance of the RestClient
///
/// // Make a request to search for movies
/// MoviesList movies = await client.getMovies("action", 1);
/// ```
///
/// To use the [RestClient] class, make sure to initialize a [Dio] instance and pass it to the constructor.
/// The base URL for the API is set to `'https://api.themoviedb.org/3'` by default, but you can override it if needed.
/// The [RestClient] class is generated using the `retrofit` package, and the code generation part is handled by the `part 'rest_client.g.dart';` statement.
/// Make sure to run the code generator (`flutter pub run build_runner build`) after making any changes to the [RestClient] class.
///
/// Note: The movie API requires an API key to access the endpoints. Please make sure to obtain an API key from TMDb and configure it appropriately
/// before using the [RestClient] class.
@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class RestClient {
  /// Constructs a new instance of the [RestClient] using the provided [Dio] instance and an optional base URL.
  ///
  /// The [dio] parameter is the [Dio] instance used for making HTTP/S requests.
  /// The [baseUrl] parameter is an optional parameter that allows overriding the base URL for the API.
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// Searches for movies based on the provided query and page number.
  ///
  /// The [query] parameter is a [String] representing the search query for movies.
  /// The [page] parameter is an [int] representing the page number of the search results.
  ///
  /// Returns a [Future] that completes with a [MoviesList] object containing the search results.
  ///
  /// Example usage:
  /// ```dart
  /// MoviesList movies = await client.getMovies("action", 1);
  /// ```
  @GET("/search/movie")
  Future<MoviesList> getMovies({
    @Query("query") required String query,
    @Query("page") required int page,
  });
}
