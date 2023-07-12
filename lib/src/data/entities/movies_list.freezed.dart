// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesList _$MoviesListFromJson(Map<String, dynamic> json) {
  return _MoviesList.fromJson(json);
}

/// @nodoc
mixin _$MoviesList {
  int get page => throw _privateConstructorUsedError;
  List<MovieSimple> get results => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "total_results")
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesListCopyWith<MoviesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesListCopyWith<$Res> {
  factory $MoviesListCopyWith(
          MoviesList value, $Res Function(MoviesList) then) =
      _$MoviesListCopyWithImpl<$Res, MoviesList>;
  @useResult
  $Res call(
      {int page,
      List<MovieSimple> results,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults});
}

/// @nodoc
class _$MoviesListCopyWithImpl<$Res, $Val extends MoviesList>
    implements $MoviesListCopyWith<$Res> {
  _$MoviesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieSimple>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviesListCopyWith<$Res>
    implements $MoviesListCopyWith<$Res> {
  factory _$$_MoviesListCopyWith(
          _$_MoviesList value, $Res Function(_$_MoviesList) then) =
      __$$_MoviesListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<MovieSimple> results,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults});
}

/// @nodoc
class __$$_MoviesListCopyWithImpl<$Res>
    extends _$MoviesListCopyWithImpl<$Res, _$_MoviesList>
    implements _$$_MoviesListCopyWith<$Res> {
  __$$_MoviesListCopyWithImpl(
      _$_MoviesList _value, $Res Function(_$_MoviesList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_MoviesList(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieSimple>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoviesList implements _MoviesList {
  const _$_MoviesList(
      {required this.page,
      required final List<MovieSimple> results,
      @JsonKey(name: "total_pages") required this.totalPages,
      @JsonKey(name: "total_results") required this.totalResults})
      : _results = results;

  factory _$_MoviesList.fromJson(Map<String, dynamic> json) =>
      _$$_MoviesListFromJson(json);

  @override
  final int page;
  final List<MovieSimple> _results;
  @override
  List<MovieSimple> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: "total_pages")
  final int totalPages;
  @override
  @JsonKey(name: "total_results")
  final int totalResults;

  @override
  String toString() {
    return 'MoviesList(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesList &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesListCopyWith<_$_MoviesList> get copyWith =>
      __$$_MoviesListCopyWithImpl<_$_MoviesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoviesListToJson(
      this,
    );
  }
}

abstract class _MoviesList implements MoviesList {
  const factory _MoviesList(
          {required final int page,
          required final List<MovieSimple> results,
          @JsonKey(name: "total_pages") required final int totalPages,
          @JsonKey(name: "total_results") required final int totalResults}) =
      _$_MoviesList;

  factory _MoviesList.fromJson(Map<String, dynamic> json) =
      _$_MoviesList.fromJson;

  @override
  int get page;
  @override
  List<MovieSimple> get results;
  @override
  @JsonKey(name: "total_pages")
  int get totalPages;
  @override
  @JsonKey(name: "total_results")
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesListCopyWith<_$_MoviesList> get copyWith =>
      throw _privateConstructorUsedError;
}
