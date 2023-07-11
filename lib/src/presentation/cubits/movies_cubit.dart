import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesCubit(this._moviesRepository) : super(const MoviesState.initial());

  void fetchMovies({required String query}) async {
    final either = await _moviesRepository.fetchMovies(query: query);
    either.fold(
      (error) => emit(MoviesState.error(error.message ?? '')),
      (movies) => emit(MoviesState.set(movies: movies)),
    );
  }
}
