import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/data/entities/movies_list.dart';
import 'package:movies/src/data/exceptions/movies_exception.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';
import 'package:movies/src/presentation/cubits/movies_cubit.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  group('MoviesCubit', () {
    late MockMoviesRepository mockMoviesRepository;

    setUp(() {
      mockMoviesRepository = MockMoviesRepository();
    });

    blocTest<MoviesCubit, MoviesState>(
      'emits [pending, set] when searchMovies succeeds',
      build: () {
        when(
          () => mockMoviesRepository.fetchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ),
        ).thenAnswer(
          (_) async => const Right(
            MoviesList(
              results: [],
              page: 1,
              totalPages: 1,
              totalResults: 1,
            ),
          ),
        );
        return MoviesCubit(mockMoviesRepository);
      },
      act: (cubit) => cubit.searchMovies(query: 'test', page: 1),
      expect: () => <MoviesState>[
        const MoviesState.pending(),
        const MoviesState.set(movies: [], page: 1),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'emits [pending, error] when searchMovies fails',
      build: () {
        when(
          () => mockMoviesRepository.fetchMovies(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ),
        ).thenAnswer(
          (_) async => Left(MoviesException(message: 'Error message')),
        );
        return MoviesCubit(mockMoviesRepository);
      },
      act: (cubit) => cubit.searchMovies(query: 'test', page: 1),
      expect: () => <MoviesState>[
        const MoviesState.pending(),
        const MoviesState.error('Error message'),
      ],
    );
  });
}
