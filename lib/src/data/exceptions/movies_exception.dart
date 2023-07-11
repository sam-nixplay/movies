import 'package:movies/src/data/exceptions/base_exception.dart';

class MoviesException extends BaseException {
  MoviesException({super.message});

  @override
  String toString() => "MoviesException: $message";
}
