import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

//Flutter integration tests do not allow for any network calls to be made.
//So we make our own mocked version of Dio that returns a response with the data we want.
class MockDio extends Mock implements Dio {
  final Map<String, dynamic> responseData;

  MockDio({required this.responseData});

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        headers: <String, dynamic>{},
      );

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async =>
      Future.value(
        Response<T>(
          requestOptions: requestOptions,
          data: responseData as T?,
          statusCode: 200,
        ),
      );

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async =>
      Future.value(
        Response<T>(
          requestOptions: RequestOptions(path: path),
          data: responseData as T?,
          statusCode: 200,
        ),
      );
}
