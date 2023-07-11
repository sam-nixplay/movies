import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(const MoviesState.initial());
}
