import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';
import 'tarif_detay.dart';

class AnayemekScreen extends StatelessWidget {
  const AnayemekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ana Yemekler",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 236, 39, 39),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 34,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildFoodCard(
                      context,
                      'Kuru Fasulye',
                      '45 dakika',
                      [
                        'Kuru Fasulye',
                        'Soğan',
                        'Domates',
                        'Sıvı Yağ',
                        'Baharatlar'
                      ],
                      'Fasulyeyi haşlayın, soğanı kavurun, domatesi ekleyin ve baharatlarla pişirin.',
                      'assets/images/fasulye.jpg'),
                  _buildFoodCard(
                      context,
                      'Pirinç Pilavı',
                      '30 dakika',
                      ['Pirinç', 'Su', 'Tuz', 'Sıvı Yağ'],
                      'Pirinçleri yıkayın, tencereye koyun, suyu ekleyin ve pişirin.',
                      'assets/images/pirinc.jpg'),
                  _buildFoodCard(
                      context,
                      'Poğaça',
                      '60 dakika',
                      ['Un', 'Yumurta', 'Süt', 'Yağ', 'Mayonez'],
                      'Hamuru yoğurun, şekil verin ve pişirin.',
                      'assets/images/pogaca.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, String title, String duration,
      List<String> ingredients, String preparation, String imagePath) {
    return GestureDetector(
      onTap: () => context.push(
        '/TarifDetay',
        extra: TarifDetayScreen(
          yemekAdi: title,
          malzemeler: ingredients,
          tarif: preparation,
        ),
      ),
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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tahmini Süre: $duration',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
