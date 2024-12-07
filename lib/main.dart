import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart'; // LoadingScreen burda

void main() {
  runApp(const TarifAtlasApp());
}

class TarifAtlasApp extends StatefulWidget {
  const TarifAtlasApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarifAtlasAppState createState() => _TarifAtlasAppState();
}

class _TarifAtlasAppState extends State<TarifAtlasApp> {
  bool _isDarkMode = false;
  bool _isLoading = true; // _isLoading variable lazim kontrol icin

  @override
  void initState() {
    super.initState();
    // Simulate loading time
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarif Atlası',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: _isLoading
          ? const LoadingScreen() // bak sonrada burda loading ekranini gosteriyosun
          : AnaSayfa(
              isDarkMode: _isDarkMode,
              toggleTheme: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
    );
  }
}
