import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:walletapp/feature/auth/screen/auth_screen.dart';
import 'package:walletapp/feature/cards/widgets/card_details.dart';
import 'package:walletapp/feature/homepage/screen/home_page.dart';
import 'package:walletapp/feature/onbording/screeen/onbording_screen.dart';

class AppRoutes {
  late final GoRouter router;

  AppRoutes() {
    router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) {
            final isLoggedIn = FirebaseAuth.instance.currentUser != null;
            return isLoggedIn ? const HomePage() : const OnBording();
          },
        ),
        GoRoute(
          path: "/on-boarding",
          builder: (context, state) => const OnBording(),
        ),
        GoRoute(
          path: "/homepage",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/Auth",
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: "/card-details/:id",
          builder: (context, state) {
            final cardId = state.pathParameters['id']!;
            return CardDetails(cardId: cardId);
          },
        ),
      ],
    );
  }
}
