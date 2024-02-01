import 'package:go_router/go_router.dart';
import 'package:walletapp/feature/auth/screen/auth_screen.dart';
import 'package:walletapp/feature/homepage/screen/home_page.dart';
import 'package:walletapp/feature/onbording/screeen/onbording_screen.dart';

class AppRoutes {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return const OnBording();
        },
      ),
      GoRoute(
        path: "/homepage",
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: "/Auth",
        builder: (context, state) {
          return const AuthScreen();
        },
      ),
    ],
  );
}
