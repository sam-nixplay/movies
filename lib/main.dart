import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/src/core/dependency_injection.dart';
import 'package:movies/src/movie_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  registerDependencies();

  runApp(const MovieApp());
}
