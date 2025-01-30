import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class AnayemekScreen extends StatelessWidget {
  const AnayemekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ana Yemekler",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
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
                    'Kuru Fasulye',
                    '1 Saat',
                    [
                      "1,5 su bardağı kuru fasulye",
                      "1 adet kuru soğan",
                      "1 yemek kaşığı domates salçası",
                      "1 yemek kaşığı biber salçası",
                      "300 g kuşbaşı dana eti",
                      "4-5 yemek kaşığı sıvı yağ",
                      "1 tatlı kaşığı tuz",
                      "1 tatlı kaşığı pul biber",
                      "1 litre sıcak su",
                    ],
                    [
                      "Kuru fasulyeler bir gece önceden sıcak suya koyulur ve ıslatılır.",
                      "Soğan yemeklik doğranır, sıvı yağ koyduğunuz düdüklü tencerede soğanlar kavrulur.",
                      "Kuşbaşı doğranmış etler ilave edilerek hafifçe kavrulur. Bu aşamada etler suyunu salıp çekecektir.",
                      "Salça ve baharatlar ilave edildikten sonra suyunu süzmüş olduğumuz kuru fasulye eklenir.",
                      "Üzerini geçecek kadar sıcak su ilave edilip düdüklü tencerenin kapağı kapatılır.",
                      "Kaynadıktan sonra kısık ateşe alınarak 30-40dk pişirilir. Afiyet olsun.",
                    ],
                    'assets/images/fasulye.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Poğaça',
                    '45 Dakika',
                    [
                      "2 yumurta akı",
                      "1 su bardağı ılık süt",
                      "1 su bardağı sıvı yağ",
                      "1 su bardağı ılık su",
                      "1 paket instant maya",
                      "4 yemek kaşığı şeker",
                      "5,5-6 su bardağı un",
                      "1 yemek kaşığı tuz",
                      "Arası İçin:",
                      "Kaşar peyniri",
                      "Üzeri İçin:",
                      "Yumurta sarısı",
                      "2-3 yemek kaşığı Sıvı yağ"
                    ],
                    [
                      "Hamurumuzu hazırlamak için yoğurma kabına sarılarını üzeri için ayırdığımız yumurta aklarını alalım.",
                      "Daha sonra üzerine süt, sıvı yağ, ılık su, maya ve şekeri alalım ve karıştıralım. Ben bu tarifimde 200 ml’lik klasik su bardaklarından kullandım.",
                      "Unumuzu yavaş yavaş kontrollü bir şekilde karıştırma kabımıza ekleyelim. Üzerine tuzu da ekledikten sonra spatula yardımı ile karıştıralım.",
                      "Hamurumuz katılaştıktan sonra tezgaha alalım ve elimizle yoğurmaya başlayalım.",
                      "Güzelce kıvam alan hamurumuzu tekrar yoğurma kabına alarak üzerini streçleyelim ve temiz bir örtü ile sararak yaklaşık 1,5 saat kadar mayalanmaya bırakalım.",
                      "Mayası gelen hamurumuzun üzerini açalım ve un serptiğimiz tezgaha alalım. Hamurumuzun havasının çıkması için 1-2 kere daha yoğuralım.",
                      "Yoğurduktan sonra hamurumuzu kesme aşamasına geçelim. Hamurumuzu 20 eşit parçaya ayıralım ve elimizle beze haline getirelim. Hamurunuzu keserken siz yapacağınız poğaça büyüklüğüne göre beze boyutlarını ayarlayabilirsiniz.",
                      "Bezenin birini alarak elimizle hafifçe genişletelim, içerisine iç harcından yerleştirerek hamurun uç kısımlarını birleştirerek elimizle yuvarlayalım. Ben iç harç olarak kaşar peyniri kullandım ancak siz dilediğiniz iç harcını kullanabilirsiniz.",
                      "Tüm bezelerimiz bitene kadar bu işleme devam edelim ve hazır hale getirdiğimiz poğaçalarımızı pişirme kağıdı serdiğimiz fırın tepsisine dizelim.",
                      "Tekrar tepsi mayası için poğaçalarımızı bekletelim. 50°C çalıştırdığımız fırında 15-20 dakika kadar mayalanmaya bırakalım. Dilerseniz üzerini temiz bir bez ile örterek de 45 dakika kadar bekletebilirsiniz.",
                      "Ayırdığımız yumurta sarılarının içerisine sıvı yağ ekleyelim ve karıştıralım. Tepsi mayası gelen poğaçaların üzerine yumurta sarısını sürelim.",
                      "Son olarak çörek otu ve susam serperek alt üst ayarda çalıştırdığımız 185°C fırında yaklaşık 20 dakika kadar kontrollü bir şekilde pişmeye bırakalım.",
                      "Pişen poğaçalarımızı fırından çıkartarak ilk sıcağı çıktıktan sonra servis edelim. Afiyet olsun."
                    ],
                    'assets/images/pogaca.jpg',
                  ),
                  _buildFoodCard(
                    context,
                    'Pirinç Pilav',
                    '30 dakika',
                    [
                      "2 yemek kaşığı tereyağı",
                      "3 yemek kaşığı sıvı yağ",
                      "2 su bardağı pirinç",
                      "Yarım su bardağı arpa şehriye",
                      "3 su bardağı sıcak su (tavuk suyu)",
                      "Tuz"
                    ],
                    [
                      "Pirinçler bol su ile yıkanarak, ılık tuzlu suda yarım saat kadar bekletilir.",
                      "Bu süre sonunda, tuzlu suyu akıtılır ve pirinçler sudan geçirilerek, tüm suyu süzdürülür.",
                      "Pilav tenceresinde tereyağı eritilir, sıvı yağ da eklenerek üzerine arpa şehriyeler eklenir.",
                      "Şehriyenin rengi dönene kadar kavrulur.",
                      "Pirinçler ilave edilerek, 2-3 dk daha kavrulur.",
                      "Üzerine sıcak su eklenir ve tuzu ilave edilir.",
                      "Tencerenin kapağı kapatılarak, yüksek ateşte fazla suyu çekip pirinçler göz göz oluncaya kadar, yani pirinçlerin üzerinde su çekilip pirinçler göründüğünde kısık ateşe alın ve tamamen suyu çekene kadar pişirin.",
                      "Ocaktan aldıktan sonra, üzerine havlu kağıt koyarak kapağını tekrar kapatın ve demlenmesini bekleyin.",
                      "Pilavı güzelce karıştırdıktan sonra servis yapabilirsiniz.",
                    ],
                    'assets/images/pirinc.jpg',
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
