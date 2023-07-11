import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movies/src/data/entities/movie_simple.dart';
import 'package:movies/src/data/exceptions/base_exception.dart';
import 'package:movies/src/data/exceptions/movies_exception.dart';
import 'package:movies/src/data/rest_client.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  RestClient _client;

  MoviesRepositoryImpl(this._client);

  @override
  Future<Either<BaseException, List<MovieSimple>>> fetchMovies(
      {required String query}) async {
    try {
      final response = await _client.getMovies(query);
      return Right(response.results);
    } on DioException catch (exc) {
      debugPrint(exc.message);
      return Left(MoviesException(message: exc.message));
    }
  }
}
