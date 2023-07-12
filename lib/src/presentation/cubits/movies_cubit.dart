import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';

/// Cubit for managing movies-related state and business logic.
///
/// The [MoviesCubit] class extends the [Cubit] class from the `flutter_bloc` package and is responsible for managing the state of movies and performing movie-related operations.
/// It interacts with the [MoviesRepository] to fetch movies based on the provided query and page number.
///
/// Example usage:
/// ```dart
/// MoviesRepository repository = MoviesRepositoryImpl(client); // Create an instance of the movies repository
/// MoviesCubit cubit = MoviesCubit(repository); // Create an instance of the movies cubit
///
/// // Search movies
/// cubit.searchMovies(query: "action", page: 1);
/// ```
///
class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesCubit(this._moviesRepository) : super(const MoviesState.initial());

  /// Searches for movies based on the provided query and page number.
  ///
  /// The [query] parameter is a [String] representing the search query for movies.
  /// The [page] parameter is an [int] representing the page number of the search results (default: 1).
  ///
  /// Emits different states based on the status of the movie search operation:
  /// - [MoviesState.pending]: Indicates that the search operation is in progress.
  /// - [MoviesState.error]: Indicates that an error occurred during the search operation.
  /// - [MoviesState.set]: Indicates that the search operation was successful and sets the retrieved movies and page number.
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
