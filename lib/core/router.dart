import 'package:go_router/go_router.dart';
import 'package:tarif_atlasi/screens/core/tatli_screen.dart';
import 'package:tarif_atlasi/screens/search_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/anayemek_screen.dart';
import '../screens/corba_screen.dart';
import '../screens/salata_screen.dart';
import '../screens/tarif_detay.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoadingScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/anayemek',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const AnayemekScreen(),
      ),
    ),
    GoRoute(
      path: '/corba',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const CorbaScreen(),
      ),
    ),
    GoRoute(
      path: '/salata',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SalataScreen(),
      ),
    ),
    GoRoute(
      path: '/tatli',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const TatliScreen(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SearchScreen(),
      ),
    ),
  ],
);
