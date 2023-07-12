import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/presentation/widgets/movie_card.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MovieCard should show title and render image from network',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: MovieCard(
              imageUrl: 'http://example.com/image.jpg',
              title: 'Movie Title',
            ),
          ),
        ),
      );
    });

    // Create the Finders.
    final titleFinder = find.text('Movie Title');
    final imageFinder = find.byType(CachedNetworkImage);

    // Use the `findsOneWidget` matcher to verify that the Text and CachedNetworkImage widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);
  });
}
