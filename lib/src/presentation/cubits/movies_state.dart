
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = _Initial;
  const factory MoviesState.pending() = _Pending;
  const factory MoviesState.set() = _Set;
  const factory MoviesState.error(String message) = _Error;
}