// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/src/data/entities/movie_simple.dart';

part 'movies_list.freezed.dart';
part 'movies_list.g.dart';

@freezed
class MoviesList with _$MoviesList {
  const factory MoviesList({
    required int page,
    required List<MovieSimple> results,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _MoviesList;

  factory MoviesList.fromJson(Map<String, dynamic> json) =>
      _$MoviesListFromJson(json);
}
