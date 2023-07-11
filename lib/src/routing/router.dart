import 'package:go_router/go_router.dart';
import 'package:movies/src/presentation/views/dashboard/dashboard_screen.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
  ],
);
