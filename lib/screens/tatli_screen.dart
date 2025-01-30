import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class TatliScreen extends StatelessWidget {
  const TatliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tatlılar",
          style: TextStyle(
            color: theme.colorScheme.tertiary,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildFoodCard(
                    context,
                    ' Fırında Sütlaç',
                    '1 Saat',
                    [
                      "1 litre süt",
                      "1 su bardağı şeker",
                      "Yarım su bardağı pirinç",
                      "3 yemek kaşığı buğday nişastası",
                      "1 paket vanilya",
                      "2 su bardağı su",
                      "Yarım su bardağı süt (nişastayı açmak için)",
                    ],
                    [
                      "Fırında sütlaç için öncelikle pirinci haşlayalım. Pirinçleri güzelce yıkadıktan sonra 2 su bardağı su ile pirinçler yumuşayıp pişene kadar haşlayın. Çok az sulu kalacaktır.",
                      "Diğer malzemeleri ekleyelim ve sütlacı pişirelim. Haşlanan pirinçlerin üzerine sütü, vanilyayı ilave edip kaynatın.",
                      "Bu arada bir kap içerisinde nişasta ve sütü (suyu) pürüzsüz kıvam alıncaya kadar karıştırın.",
                      "Karışım kaynamaya başlayınca şekeri ve yarım su bardağı sütle karıştırdığınız 3 yemek kaşığı buğday nişastasını ilave ediniz. 10-15 dk. daha kaynatıp ocağın altını kapatın.",
                      "Sütlaçları fırına sürelim. Fırın için uygun ısıya dayanıklı sütlaç kaselerine sütlaçlarınızı paylaştırın.",
                      "Tepsinize soğuk su doldurun ve sütlaç kaplarını fırın tepsisine dizin (Tepsideki su sütlaç kaplarının yarısına kadar gelecek)",
                      "Tepsiyi fırınınızın en üst rafına yerleştirin.",
                      "180 derecede, sütlaçlarınız kızarana kadar fırınlayın. Afiyet olsun ",
                    ],
                    'assets/images/sütlac.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Revani',
                    '1 Saat 15 Dakika',
                    [
                      "Kek için;",
                      "3 yumurta",
                      "1 su bardağı şeker",
                      "1 su bardağı yoğurt",
                      "1 su bardağı irmik",
                      "1 su bardağı un",
                      "1 paket vanilya",
                      "1 paket kabartma tozu",
                      "1 çay bardağı sıvı yağ",
                      "Şerbet için;",
                      "3 su bardağı su",
                      "3 su bardağı seker",
                      "Yarım limon suyu",
                    ],
                    [
                      "İlk olarak şerbet hazırlanır. Şerbet için tencereye şeker ve su alınarak kaynatılır. Kaynadıktan sonra yarım limon suyu eklenip 1-2 dakika daha kaynatılıp altı kapatılır.",
                      "Kek için, yumurta ve şeker çırpma kabına alınarak iyice çırpılır.",
                      "Ardından sıvı yağ, yoğurt ve irmik eklenip çırpılır.",
                      "Son olarak un, kabartma tozu ve vanilya da eklenerek iyice çırpılır.",
                      "Yağlamış olduğumuz fırın kabına kek hamuru dökülür.",
                      "170 derece fırında üstü kızarana dek yaklaşık 30 dakika pişirilir.",
                      "İlk sıcaklığı çıkan kek dilimlere kesilir ve sıcak kekin üstüne soğumuş şerbet dökülür.",
                      "1-2 saat dinlendirdikten sonra üzeri isteğe göre krem şanti, hindistan cevizi yada fıstık vb. ile süslenerek servis edilir. Afiyet olsun.",
                    ],
                    'assets/images/revani.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, String title, String duration,
      List<String> malzemeler, List<String> yapilis, String imagePath) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.push(
          '/Tarif',
          extra: {
            'isim': title,
            'malzemeler': malzemeler,
            'yapilis': yapilis,
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
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
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tahmini Süre: $duration',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
