import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/src/data/repositories/movies_repository/movies_repository_impl.dart';
import 'package:movies/src/data/rest_client.dart';
import 'package:movies/src/domain/repositories/movies_repository/movies_repository.dart';
import 'package:movies/src/presentation/cubits/movies_cubit.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  final token = dotenv.env['API_TOKEN'];

  final dio = Dio();
  dio.options.headers = {
    'accept': 'application/json',
    "Authorization": "Bearer $token",
  };

  getIt.registerLazySingleton<RestClient>(
    () => RestClient(dio),
  );

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(getIt<RestClient>()),
  );

  getIt.registerLazySingleton<MoviesCubit>(
    () => MoviesCubit(getIt<MoviesRepository>()),
  );
}
