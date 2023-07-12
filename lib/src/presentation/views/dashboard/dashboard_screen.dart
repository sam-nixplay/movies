import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/src/core/dependency_injection.dart';
import 'package:movies/src/data/entities/movie_simple.dart';
import 'package:movies/src/presentation/cubits/movies_cubit.dart';
import 'package:movies/src/presentation/cubits/movies_state.dart';
import 'package:movies/src/presentation/widgets/movie_card.dart';

const int _pageSize = 20;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late MoviesCubit _moviesCubit;

  final _queryTextController = TextEditingController();

  final _pagingController = PagingController<int, MovieSimple>(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _moviesCubit = getIt<MoviesCubit>();

    _addMoviesCubitListener();

    _pagingController.appendPage([], 1);

    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey > 1) {
        _moviesCubit.searchMovies(
          query: _queryTextController.text,
          page: pageKey,
        );
      }
    });
  }

  void _addMoviesCubitListener() {
    _moviesCubit.stream.listen((state) {
      if (state is MoviesSetState) {
        final newItems = state.movies;
        final isLastPage = newItems.length < _pageSize;

        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = state.page + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _queryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _queryTextController,
                      decoration: const InputDecoration(
                        hintText: 'Search by name',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _moviesCubit.searchMovies(query: _queryTextController.text);
                  },
                  child: const Text('Search'),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildPagedGridView())
            // Expanded(
            //   child: BlocBuilder<MoviesCubit, MoviesState>(
            //     bloc: _moviesCubit,
            //     builder: (context, state) => state.when(
            //       initial: () => const Center(
            //         child: Text(
            //           'Search for a movie by title',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //       ),
            //       pending: () => const Center(
            //         child: CircularProgressIndicator(),
            //       ),
            //       set: (movies) => movies.isEmpty
            //           ? const Center(
            //               child: Text(
            //                 'No movies found',
            //                 style: TextStyle(fontSize: 20, color: Colors.red),
            //               ),
            //             )
            //           : LayoutBuilder(
            //               builder: (context, constraints) => GridView.builder(
            //                 itemCount: movies.length,
            //                 gridDelegate:
            //                     SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: switch (constraints.maxWidth) {
            //                     < 600 => 2,
            //                     < 1000 => 3,
            //                     _ => 5,
            //                   },
            //                   childAspectRatio:
            //                       0.7, // Adjust based on your requirement
            //                 ),
            //                 itemBuilder: (context, index) => MovieCard(
            //                   imageUrl:
            //                       "https://image.tmdb.org/t/p/w500${movies.elementAt(index).posterPath}",
            //                   title: movies.elementAt(index).title,
            //                 ),
            //               ),
            //             ),
            //       error: (message) => Center(
            //         child: Text(
            //           message,
            //           style: const TextStyle(color: Colors.red),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagedGridView() => PagedGridView<int, MovieSimple>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<MovieSimple>(
          itemBuilder: (context, movie, index) => MovieCard(
            imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            title: movie.title,
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 0.7, // Adjust based on your requirement
        ),
      );
}
