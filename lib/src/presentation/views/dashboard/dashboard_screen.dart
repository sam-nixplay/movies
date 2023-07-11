import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/dependency_injection.dart';
import 'package:movies/src/presentation/cubits/movies_cubit.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';
import 'package:movies/src/presentation/widgets/movie_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late MoviesCubit _moviesCubit;

  @override
  void initState() {
    super.initState();
    _moviesCubit = getIt<MoviesCubit>();
    _moviesCubit.fetchMovies(query: "Star Wars");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesCubit, MoviesState>(
        bloc: _moviesCubit,
        builder: (context, state) => state.maybeWhen(
          set: (movies) => movies.isEmpty
              ? const Center(
                  child: Text(
                    'No movies found',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) => GridView.builder(
                    itemCount: movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: switch (constraints.maxWidth) {
                        < 600 => 2,
                        < 1000 => 3,
                        _ => 5,
                      },
                      childAspectRatio: 0.7, // Adjust based on your requirement
                    ),
                    itemBuilder: (context, index) => MovieCard(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${movies.elementAt(index).posterPath}",
                      title: movies.elementAt(index).title,
                    ),
                  ),
                ),
          error: (message) => Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
