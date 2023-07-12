import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/data/entities/movie_simple.dart';
import 'package:movies/src/data/entities/movies_list.dart';
import 'package:movies/src/data/exceptions/movies_exception.dart';
import 'package:movies/src/data/repositories/movies_repository/movies_repository_impl.dart';
import 'package:movies/src/data/rest_client.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late MoviesRepositoryImpl moviesRepositoryImpl;
  late MockRestClient mockRestClient;
  late MoviesList mockMoviesList;

  setUp(() {
    mockRestClient = MockRestClient();
    moviesRepositoryImpl = MoviesRepositoryImpl(mockRestClient);
    mockMoviesList = const MoviesList(
      results: [
        MovieSimple(id: 1, title: 'Test Movie'),
      ],
      page: 1,
      totalPages: 1,
      totalResults: 1,
    );
  });

  test('fetchMovies returns MoviesList on successful API call', () async {
    when(
      () => mockRestClient.getMovies(
        query: any(named: 'query'),
        page: any(named: 'page'),
      ),
    ).thenAnswer(
      (_) async => mockMoviesList,
    );

    final result =
        await moviesRepositoryImpl.fetchMovies(query: 'test', page: 1);

    verify(() => mockRestClient.getMovies(query: 'test', page: 1));
    expect(result, equals(Right(mockMoviesList)));
  });

  test('fetchMovies returns MoviesException on DioException', () async {
    when(
      () => mockRestClient.getMovies(
        query: any(named: 'query'),
        page: any(named: 'page'),
      ),
    ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

    final result =
        await moviesRepositoryImpl.fetchMovies(query: 'test', page: 1);

    verify(() => mockRestClient.getMovies(query: 'test', page: 1));
    expect(result.isLeft(), equals(true));
    expect(result.fold((l) => l, (r) => null), isA<MoviesException>());
  });
}
