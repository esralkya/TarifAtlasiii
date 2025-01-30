import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarif Atlası",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {
              context.push("/search");
            },
          ),
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: theme.colorScheme.onSecondary,
              size: 34,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: const Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Ana yemek'),
              onTap: () => context.push("/anayemek"),
            ),
            ListTile(
              leading: const Icon(Icons.ramen_dining),
              title: const Text('Çorbalar'),
              onTap: () => context.push("/corba"),
            ),
            ListTile(
              leading: const Icon(Icons.local_dining),
              title: const Text('Salatalar'),
              onTap: () => context.push("/salata"),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Tatlılar'),
              onTap: () => context.push("/tatli"),
            ),
            const Spacer(),
            const Divider(),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildFoodCard(context, 'Kuru Fasulye', '45 dakika',
                      '/fasulye', 'assets/images/fasulye.jpg'),
                  _buildFoodCard(context, 'Pirinç Pilavı', '30 dakika',
                      '/pirinc', 'assets/images/pirinc.jpg'),
                  _buildFoodCard(context, 'Poğaça', '60 dakika', '/pogaca',
                      'assets/images/pogaca.jpg'),
                  _buildFoodCard(context, 'Arpa Şehriyeli Tavuk Salatası',
                      '15 dakika', '/salata', 'assets/images/salata.jpg'),
                  _buildFoodCard(context, 'Patates Salatası', '20 dakika',
                      '/patates', 'assets/images/patates.jpg'),
                  _buildFoodCard(context, 'Mercimek Çorbası', '25 dakika',
                      '/mercimek', 'assets/images/mercimek.jpg'),
                  _buildFoodCard(context, 'Domates Çorbası', '20 dakika',
                      '/domates', 'assets/images/domates.jpg'),
                  _buildFoodCard(context, 'Yayla Çorbası', '30 dakika',
                      '/yayla', 'assets/images/yayla.jpg'),
                  _buildFoodCard(context, 'Sütlaç', '40 dakika', '/sütlac',
                      'assets/images/sütlac.jpg'),
                  _buildFoodCard(context, 'Revani', '50 dakika', '/revani',
                      'assets/images/revani.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, String title, String duration,
      String route, String imagePath) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.push(route),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Tahmini Süre: $duration',
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.colorScheme.onSurfaceVariant,
                        )),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
