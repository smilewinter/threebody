import 'package:threebody/src/ui/pages/three_body_world_page.dart';
import 'package:threebody/src/ui/pages/three_body_home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:threebody/src/ui/pages/first_contact_page.dart';
import 'package:threebody/src/ui/pages/dark_forest_page.dart';
import 'package:threebody/src/ui/pages/wallfacer_page.dart';
import 'package:threebody/src/ui/pages/dimensional_strike_page.dart';
import 'package:threebody/src/ui/pages/universe_destiny_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const ThreeBodyHomePage(),
      ),
      GoRoute(
        path: '/three-body-world',
        name: 'threeBodyWorld',
        builder: (context, state) => const ThreeBodyWorldPage(),
      ),
      GoRoute(
        path: '/first-contact',
        name: 'firstContact',
        builder: (context, state) => const FirstContactPage(),
      ),
      GoRoute(
        path: '/dark-forest',
        name: 'darkForest',
        builder: (context, state) => const DarkForestPage(),
      ),
      GoRoute(
        path: '/wallfacer',
        name: 'wallfacer',
        builder: (context, state) => const WallfacerPage(),
      ),
      GoRoute(
        path: '/dimensional-strike',
        name: 'dimensionalStrike',
        builder: (context, state) => const DimensionalStrikePage(),
      ),
      GoRoute(
        path: '/universe-destiny',
        name: 'universeDestiny',
        builder: (context, state) => const UniverseDestinyPage(),
      ),
    ],
  );
}
