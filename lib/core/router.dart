import 'package:flutter/material.dart';
import 'package:flutter_app/screens/loading_screen.dart';
import 'package:go_router/go_router.dart';
import 'screens/loading_screen.dart'; // Loading ekranı
import 'screens/home_screen.dart'; // Ana sayfa ekranı

final GoRouter router = GoRouter(
  initialLocation: '/', // Başlangıç yolu, loading ekranı
  routes: [
    // Loading Ekranı (ilk ekran)
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),

    // Ana Sayfa (Home Ekranı)
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(
        isDarkMode: false,
        toggleTheme: () {},
      ),
    ),
  ],
);
