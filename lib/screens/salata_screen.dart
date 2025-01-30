import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class SalataScreen extends StatelessWidget {
  const SalataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Salatalar",
          style: TextStyle(color: Colors.black),
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
                    'Arpa Şehriyeli Tavuk Salatası',
                    '30 Dakika',
                    [
                      "1,5 su bardağı arpa şehriye",
                      "Yarım çay bardağı zeytinyağı",
                      "1 tatlı kaşığı tuz",
                      "2 su bardağı sıcak su",
                      "3 adet közlenmiş kırmızı biber",
                      "Yarım demet dereotu",
                      "6 adet kornişon turşu",
                      "1 küçük kutu konserve mısır",
                      "yarım tavuk göğsü",
                      "1 adet limon suyu",
                    ],
                    [
                      "Öncelikle tavaya zeytinyağını alalım, üzerine şehriyeleri ilave ederek renkleri dönünceye kadar karıştırarak kavuralım.",
                      "Şehriyeleri kavurduktan sonra tuz ve sıcak suyu ilave ederek karıştıralım.",
                      "Tencerenin kapağını kapatalım ve şehriyeler yumuşayıp suyunu çekinceye kadar orta ateşte pişmeye bırakalım.",
                      "Ardından ocaktan alarak soğumaya bırakalım.",
                      "Pişen şehriyelerin üzerine kağıt havlu kapatalım ve demlenmeye bırakalım.",
                      "Dereotunu ince ince kıyalım. Kornişon turşu ve közlenmiş biberi de küçük küçük doğrayalım. Haşlanmış tavuk göğsünü didikleyelim.",
                      "Soğuyan arpa şehriyeleri uygun bir karıştırma kabına alalım. Üzerine tavuk göğsü, haşlanmış mısır, kırmızı biber, turşu, dereotu ve limon suyunu ekleyerek güzelce karıştıralım.",
                      "Tavuklu arpa şehriye salatamız servise hazır. Afiyet olsun!",
                    ],
                    'assets/images/salata.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Patates Salatası',
                    '25 Dakika',
                    [
                      "4 adet orta boy patates",
                      "1 tatlı kaşığı pul biber",
                      "1 tatlı kaşığı sumak",
                      "¾ çay bardağı zeytinyağı",
                      "3-4 dal taze soğan",
                      "8-9 dal maydanoz",
                      "Tuz",
                      "Süslemek için:",
                      "Siyah zeytin ve yumurta",
                    ],
                    [
                      "Patateslerimizi iyice yıkayıp, kabuklu şekilde haşlayalım. Haşlanma testini sivri uçlu bir bıçak yardımıyla patateslere batırarak yapabilirsiniz.(20 dk. kadar)",
                      "Patatesler haşlanırken, zeytinyağı ,tuz ,pul biber ve sumağı yayvan bir kapta karıştırın. Yeşillikleri yıkayıp, ince doğrayın. Yumurtayı katı olarak haşlayın.",
                      "Haşlanmış patatesler elinizin dayanabileceği soğukluğa ulaşınca, kabuklarını soyun.",
                      "Arzu ettiğiniz ebatta küp doğrayın (çok küçük olmasın haşlanmış patates nazik olur, karıştırma esnasında sunum şıklığı açısından dağılmaması lazım).",
                      "Sosunuzla patatesleri buluştururken sık sık karıştırın.(Ilık patateslerinizin zeytinyağı ve özellikle sumak ekşiliğini çekmesi için).",
                      "Sosunu tam çekmiş, soğumuş patateslerinize yeşilliğinizi ve arzu ettiğiniz miktarda limon suyu(ekşi severler için ) ekleyerek son kez karıştırın servis tabağına alın.",
                      "Siyah zeytin ve yumurta ile arzu ettiğiniz gibi süsleyin.",
                    ],
                    'assets/images/patates.jpg',
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
