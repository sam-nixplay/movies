import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/src/data/entities/movie_simple.dart';

part 'movies_state.freezed.dart';

/// Enumerates the possible states of the movies feature.
@freezed
class MoviesState with _$MoviesState {
  /// Represents the initial state of the movies feature.
  const factory MoviesState.initial() = _Initial;

  /// Represents the state when a movie search operation is pending.
  const factory MoviesState.pending() = _Pending;

  /// Represents the state when movies have been successfully fetched and set.
  ///
  /// The [movies] parameter is a [List] of [MovieSimple] representing the fetched movies.
  /// The [page] parameter is an [int] representing the page number of the fetched movies.
  const factory MoviesState.set({
    required List<MovieSimple> movies,
    required int page,
  }) = MoviesSetState;

  /// Represents the state when an error occurs during the movie search operation.
  ///
  /// The [message] parameter is a [String] representing the error message.
  const factory MoviesState.error(String message) = _Error;
}
