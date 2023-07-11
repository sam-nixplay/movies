// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoviesList _$$_MoviesListFromJson(Map<String, dynamic> json) =>
    _$_MoviesList(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieSimple.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$$_MoviesListToJson(_$_MoviesList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
