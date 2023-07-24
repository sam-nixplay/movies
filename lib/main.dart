import 'package:flutter/material.dart';
import 'package:movies/src/core/dependency_injection.dart';
import 'package:movies/src/movie_app.dart';

void main() async {
  registerDependencies();
  runApp(const MovieApp());
}
