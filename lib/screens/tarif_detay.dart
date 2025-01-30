import 'package:flutter/material.dart';

class TarifDetay extends StatelessWidget {
  final String isim;
  final List<String> malzemeler;
  final List<String> yapilis;

  const TarifDetay({
    super.key,
    required this.isim,
    required this.malzemeler,
    required this.yapilis,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(isim, style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Malzemeler",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...malzemeler.map((malzeme) {
                  return Row(
                    children: [
                      const SizedBox(width: 8),
                      Expanded(child: Text('• $malzeme')),
                    ],
                  );
                }),
                const SizedBox(height: 16),
                const Text(
                  "Tarif",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...yapilis.map((adim) {
                  return Row(
                    children: [
                      const Icon(Icons.check_circle, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text('▪ $adim')),
                    ],
                  );
                }),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Icon(Icons.access_time, size: 20),
                    SizedBox(width: 8),
                    Expanded(child: Text("Hazırlık Süresi: 30 dakika")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
