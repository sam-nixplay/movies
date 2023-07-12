import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesCubit(this._moviesRepository) : super(const MoviesState.initial());

  void searchMovies({required String query, int page = 1}) async {
    emit(const MoviesState.pending());

    final either =
        await _moviesRepository.fetchMovies(query: query, page: page);
    either.fold(
      (error) => emit(MoviesState.error(error.message ?? '')),
      (moviesList) {
        emit(MoviesState.set(
          movies: moviesList.results,
          page: moviesList.page,
        ));
      },
    );
  }
}
