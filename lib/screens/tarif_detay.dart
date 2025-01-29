import 'package:flutter/material.dart';

class TarifDetayScreen extends StatelessWidget {
  final String yemekAdi;
  final List<String> malzemeler;
  final String tarif;

  const TarifDetayScreen({
    super.key,
    required this.yemekAdi,
    required this.malzemeler,
    required this.tarif,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(yemekAdi),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Malzemeler",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...malzemeler.map((malzeme) => Text("• $malzeme")),
            const SizedBox(height: 16),
            const Text(
              "Tarif",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(tarif),
          ],
        ),
      ),
    );
  }
}
