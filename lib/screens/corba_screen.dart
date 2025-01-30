import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class CorbaScreen extends StatelessWidget {
  const CorbaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Çorbalar",
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
                    'Mercimek Çorbası',
                    '40 Dakika',
                    [
                      "2 su bardağı kırmızı mercimek",
                      "1 adet soğan",
                      "2 yemek kaşığı un",
                      "1 adet havuç",
                      "Yarım yemek kaşığı biber ya da  domates salçası ",
                      "1 tatlı kaşığı tuz",
                      "Yarım çay kaşığı karabiber",
                      "1 çay kaşığı kimyon (isteğe bağlı)",
                      "2 litre sıcak su",
                      "5 yemek kaşığı sıvı yağ",
                      "Sosu için:",
                      "2 yemek kaşığı tereyağı",
                      "1 tatlı kaşığı kırmızı toz biber",
                    ],
                    [
                      "Kırmızı mercimek çorbası için sıvı yağı tencereye alınarak yemeklik doğranan soğanlar hafif pembeleşinceye kadar kavrulur.",
                      "Daha sonra un ilave edilerek kısık ateşte kavurmaya devam edilir.",
                      "Salça kullanılacak ise salça ilave edilir, kavrulduktan sonra küp küp doğranmış havuç ve iyice yıkanıp suyu süzülen mercimekler ilave edilir.",
                      "Üzerine su eklenerek karıştırılır ve tencerenin kapağı kapatılır. Çorbamız kaynayana kadar orta ateşte, kaynadıktan sonra mercimekler ve havuçlar yumuşayana kadar ara ara karıştırılarak kısık ateşte pişirilir.",
                      "Çorba piştikten sonra el blenderı ile güzelce ezilir. Eğer blenderiniz yoksa süzgeçten de geçirebilirsiniz.",
                      "Karabiber, tuz ve isteğe bağlı olarak kimyon eklenir ve karıştırılır. 5 dakika daha pişirilerek ocaktan alınır.",
                      "Kıvamı koyu gelirse size, bir miktar su ilave edilerek bir taşım kaynatılır.",
                      "Bu arada küçük bir tavaya iki yemek kaşığı tereyağı alınır, kızdırılır ve bir tatlı kaşığı kırmızı toz biber eklenerek ocaktan alınır.",
                      "Mercimek çorbası servis kasesine alındıktan sonra üzerine kırmızı biberli sos gezdirilir ve bir dilim limon ile servis edilir."
                    ],
                    'assets/images/mercimek.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Domates Çorbası',
                    '35 Dakika',
                    [
                      "3 adet domates",
                      "2 yemek kaşığı sıvı yağ",
                      "1 yemek kaşığı tereyağ",
                      "2 yemek kaşığı un(tepeleme)",
                      "1 yemek kaşığı salça",
                      "1 tatlı kaşığı tatlı kırmızı toz biber",
                      "1 çay bardağı süt",
                      "5 su bardağı su",
                      "1 çay kaşığı karabiber",
                      "Tuz",
                      "Üzeri için:",
                      "Kurutulmuş ekmek",
                      "Rendelenmiş kaşar peyniri",
                    ],
                    [
                      "İlk önce sıvı yağ ve tereyağı eritin unu koyup kokusu çıkana kadar kavurun.",
                      "Kabukları soyulmuş domatesi rondoda çekin ve kavrulmuş unun içine atın.",
                      "Salçayı, tatlı kırmızı toz biberi de ekleyip bir dakika kadar daha kavurun.",
                      "Üzerine yavaş yavaş suyu ekleyip topaklanmaması için karıştırın. Sonra isterseniz süzgeçten geçirin.",
                      "İçine karabiber ve tuz ekleyip karıştırarak pişirin.",
                      "Kaynamaya başlayınca altını kısıp 2 dakika kadar daha kaynatın.",
                      "İçine sütü ekleyip bir taşım kaynatıp altını kapatın."
                    ],
                    'assets/images/domates.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Yayla Çorbası',
                    '50 Dakika',
                    [
                      "1 fincan pirinç (Türk kahvesi fincanı)",
                      "7 su bardağı su",
                      "1 su bardağı yoğurt",
                      "1 yumurta",
                      "Yarım fincandan biraz fazla un (Türk kahvesi fincanı)",
                      "3 yemek kaşığı sıvı yağ",
                      "2 yemek kaşığı tereyağı",
                      "Tuz",
                      "Nane"
                    ],
                    [
                      "Su, sıvı yağ, tuz ve pirinçler tencereye alınır. Pirinçler yumuşayıncaya kadar kaynatılır.",
                      "Ayrı bir kasede yoğurt, yumurta ve un, 1 su bardağına yakın su ile birlikte iyice çırpılır.",
                      "Pirinçler yumuşayınca hızlıca karıştırarak yoğurtlu karışım çorbaya eklenir. Kaynayana kadar karıştırılır. Kaynayınca kısık ateşte 10-15 dk kaynatılır. Ara sıra karıştırmayı ihmal etmeyin.",
                      "Çorbamız piştikten sonra altı kapatılır.",
                      "Şık bir sunum olması açısından;",
                      "Çorba kaselere alınır. Ayrı bir yerde tereyağı kızdırılarak nane ile karıştırılır. Ve kaselerdeki çorbaların üzerinde gezdirilir. Kalan naneli tereyağını tenceredeki çorbaya koyup karıştırın.",
                      "Mis kokulu yayla çorbamız servise hazır."
                    ],
                    'assets/images/yayla.jpg',
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
