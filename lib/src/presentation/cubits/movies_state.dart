import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/src/data/entities/movie_simple.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = _Initial;
  const factory MoviesState.pending() = _Pending;
  const factory MoviesState.set({
    required List<MovieSimple> movies,
    required int page,
  }) = MoviesSetState;
  const factory MoviesState.error(String message) = _Error;
}
