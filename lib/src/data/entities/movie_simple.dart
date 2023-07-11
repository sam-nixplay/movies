// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_simple.freezed.dart';
part 'movie_simple.g.dart';

@freezed
class MovieSimple with _$MovieSimple {
  const factory MovieSimple({
    required int id,
    required String title,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "genre_ids") List<int>? genreIds,
    @JsonKey(name: "original_language") String? originalLanguage,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "release_date") String? releaseDate,
    @Default(false) bool video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
    @Default(false) bool adult,
  }) = _MovieSimple;

  factory MovieSimple.fromJson(Map<String, dynamic> json) =>
      _$MovieSimpleFromJson(json);
}
