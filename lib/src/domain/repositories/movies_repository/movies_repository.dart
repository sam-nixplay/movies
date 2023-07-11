import 'package:fpdart/fpdart.dart';
import 'package:movies/src/data/entities/movie_simple.dart';
import 'package:movies/src/data/exceptions/base_exception.dart';
import 'package:movies/src/domain/repositories/base_repository.dart';

abstract class MoviesRepository extends BaseRepository {
  Future<Either<BaseException, List<MovieSimple>>> fetchMovies(
      {required String query});
}
