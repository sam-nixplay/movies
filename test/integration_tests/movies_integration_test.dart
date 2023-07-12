import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/core/dependency_injection.dart';
import 'package:movies/src/movie_app.dart';
import 'package:patrol/patrol.dart';

import 'mocks/mock_dio.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await dotenv.load(fileName: ".env");

    registerDependencies(
      mockDio: MockDio(
        responseData: {
          "page": 1,
          "results": [
            {
              "id": 1,
              "title": "Star Wars",
            },
          ],
          "total_pages": 1,
          "total_results": 1
        },
      ),
    );
  });

  patrolTest(
    'searches movies successfully',
    ($) async {
      await $.pumpWidgetAndSettle(const MovieApp());

      await $(#searchTextField).enterText('Star');

      await $(#searchButton).tap();

      await $('Star Wars').waitUntilVisible();
    },
  );
}
