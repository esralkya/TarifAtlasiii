import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';
import 'tarif_detay.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> yemekler = [
    {
      "isim": "Kuru Fasulye",
      "resim": "assets/images/fasulye.jpg",
      "kategori": "Ana Yemekler",
      "sure": "1 saat",
      "malzemeler": [
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
      "yapilis": [
        "Kuru fasulyeler bir gece önceden sıcak suya koyulur ve ıslatılır.",
        "Soğan yemeklik doğranır, sıvı yağ koyduğunuz düdüklü tencerede soğanlar kavrulur.",
        "Kuşbaşı doğranmış etler ilave edilerek hafifçe kavrulur. Bu aşamada etler suyunu salıp çekecektir.",
        "Salça ve baharatlar ilave edildikten sonra suyunu süzmüş olduğumuz kuru fasulye eklenir.",
        "Üzerini geçecek kadar sıcak su ilave edilip düdüklü tencerenin kapağı kapatılır.",
        "Kaynadıktan sonra kısık ateşe alınarak 30-40dk pişirilir. Afiyet olsun.",
      ]
    },
    {
      "isim": "Pirinç Pilavı",
      "resim": "assets/images/pirinc.jpg",
      "kategori": "Ana Yemekler",
      "sure": "30 dakika",
      "malzemeler": [
        "2 yemek kaşığı tereyağı",
        "3 yemek kaşığı sıvı yağ",
        "2 su bardağı pirinç",
        "Yarım su bardağı arpa şehriye",
        "3 su bardağı sıcak su (tavuk suyu)",
        "Tuz"
      ],
      "yapilis": [
        "Pirinçler bol su ile yıkanarak, ılık tuzlu suda yarım saat kadar bekletilir.",
        "Bu süre sonunda, tuzlu suyu akıtılır ve pirinçler sudan geçirilerek, tüm suyu süzdürülür.",
        "Pilav tenceresinde tereyağı eritilir, sıvı yağ da eklenerek üzerine arpa şehriyeler eklenir.",
        "Şehriyenin rengi dönene kadar kavrulur.",
        "Pirinçler ilave edilerek, 2-3 dk daha kavrulur.",
        "Üzerine sıcak su eklenir ve tuzu ilave edilir.",
        "Tencerenin kapağı kapatılarak, yüksek ateşte fazla suyu çekip pirinçler göz göz oluncaya kadar, yani pirinçlerin üzerinde su çekilip pirinçler göründüğünde kısık ateşe alın ve tamamen suyu çekene kadar pişirin.",
        "Ocaktan aldıktan sonra, üzerine havlu kağıt koyarak kapağını tekrar kapatın ve demlenmesini bekleyin.",
        "Pilavı güzelce karıştırdıktan sonra servis yapabilirsiniz.",
      ]
    },
    {
      "isim": "Poğaça",
      "resim": "assets/images/pogaca.jpg",
      "kategori": "Ana Yemekler",
      "sure": "45 Dakika",
      "malzemeler": [
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
      "yapilis": [
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
      ]
    },
    {
      "isim": "Arpa Şehriyeli Tavuklu Salata",
      "resim": "assets/images/salata.jpg",
      "kategori": "Salatalar",
      "sure": "30 Dakika",
      "malzemeler": [
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
      "yapilis": [
        "Öncelikle tavaya zeytinyağını alalım, üzerine şehriyeleri ilave ederek renkleri dönünceye kadar karıştırarak kavuralım.",
        "Şehriyeleri kavurduktan sonra tuz ve sıcak suyu ilave ederek karıştıralım.",
        "Tencerenin kapağını kapatalım ve şehriyeler yumuşayıp suyunu çekinceye kadar orta ateşte pişmeye bırakalım.",
        "Ardından ocaktan alarak soğumaya bırakalım.",
        "Pişen şehriyelerin üzerine kağıt havlu kapatalım ve demlenmeye bırakalım.",
        "Dereotunu ince ince kıyalım. Kornişon turşu ve közlenmiş biberi de küçük küçük doğrayalım. Haşlanmış tavuk göğsünü didikleyelim.",
        "Soğuyan arpa şehriyeleri uygun bir karıştırma kabına alalım. Üzerine tavuk göğsü, haşlanmış mısır, kırmızı biber, turşu, dereotu ve limon suyunu ekleyerek güzelce karıştıralım.",
        "Tavuklu arpa şehriye salatamız servise hazır. Afiyet olsun!",
      ]
    },
    {
      "isim": "Patates Salatası",
      "resim": "assets/images/patates.jpg",
      "kategori": "Salatalar",
      "sure": "30 Dakika",
      "malzemeler": [
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
      "yapilis": [
        "Patateslerimizi iyice yıkayıp, kabuklu şekilde haşlayalım. Haşlanma testini sivri uçlu bir bıçak yardımıyla patateslere batırarak yapabilirsiniz.(20 dk. kadar)",
        "Patatesler haşlanırken, zeytinyağı ,tuz ,pul biber ve sumağı yayvan bir kapta karıştırın. Yeşillikleri yıkayıp, ince doğrayın. Yumurtayı katı olarak haşlayın.",
        "Haşlanmış patatesler elinizin dayanabileceği soğukluğa ulaşınca, kabuklarını soyun.",
        "Arzu ettiğiniz ebatta küp doğrayın (çok küçük olmasın haşlanmış patates nazik olur, karıştırma esnasında sunum şıklığı açısından dağılmaması lazım).",
        "Sosunuzla patatesleri buluştururken sık sık karıştırın.(Ilık patateslerinizin zeytinyağı ve özellikle sumak ekşiliğini çekmesi için).",
        "Sosunu tam çekmiş, soğumuş patateslerinize yeşilliğinizi ve arzu ettiğiniz miktarda limon suyu(ekşi severler için ) ekleyerek son kez karıştırın servis tabağına alın.",
        "Siyah zeytin ve yumurta ile arzu ettiğiniz gibi süsleyin.",
      ]
    },
    {
      "isim": "Mercimek Çorbası",
      "resim": "assets/images/mercimek.jpg",
      "kategori": "Çorbalar",
      "sure": "40 Dakika",
      "malzemeler": [
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
      "yapilis": [
        "Kırmızı mercimek çorbası için sıvı yağı tencereye alınarak yemeklik doğranan soğanlar hafif pembeleşinceye kadar kavrulur.",
        "Daha sonra un ilave edilerek kısık ateşte kavurmaya devam edilir.",
        "Salça kullanılacak ise salça ilave edilir, kavrulduktan sonra küp küp doğranmış havuç ve iyice yıkanıp suyu süzülen mercimekler ilave edilir.",
        "Üzerine su eklenerek karıştırılır ve tencerenin kapağı kapatılır. Çorbamız kaynayana kadar orta ateşte, kaynadıktan sonra mercimekler ve havuçlar yumuşayana kadar ara ara karıştırılarak kısık ateşte pişirilir.",
        "Çorba piştikten sonra el blenderı ile güzelce ezilir. Eğer blenderiniz yoksa süzgeçten de geçirebilirsiniz.",
        "Karabiber, tuz ve isteğe bağlı olarak kimyon eklenir ve karıştırılır. 5 dakika daha pişirilerek ocaktan alınır.",
        "Kıvamı koyu gelirse size, bir miktar su ilave edilerek bir taşım kaynatılır.",
        "Bu arada küçük bir tavaya iki yemek kaşığı tereyağı alınır, kızdırılır ve bir tatlı kaşığı kırmızı toz biber eklenerek ocaktan alınır.",
        "Mercimek çorbası servis kasesine alındıktan sonra üzerine kırmızı biberli sos gezdirilir ve bir dilim limon ile servis edilir."
      ]
    },
    {
      "isim": "Domates Çorbası",
      "resim": "assets/images/domates.jpg",
      "kategori": "Çorbalar",
      "sure": "35 Dakika",
      "malzemeler": [
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
      "yapilis": [
        "İlk önce sıvı yağ ve tereyağı eritin unu koyup kokusu çıkana kadar kavurun.",
        "Kabukları soyulmuş domatesi rondoda çekin ve kavrulmuş unun içine atın.",
        "Salçayı, tatlı kırmızı toz biberi de ekleyip bir dakika kadar daha kavurun.",
        "Üzerine yavaş yavaş suyu ekleyip topaklanmaması için karıştırın. Sonra isterseniz süzgeçten geçirin.",
        "İçine karabiber ve tuz ekleyip karıştırarak pişirin.",
        "Kaynamaya başlayınca altını kısıp 2 dakika kadar daha kaynatın.",
        "İçine sütü ekleyip bir taşım kaynatıp altını kapatın."
      ]
    },
    {
      "isim": "Yayla Çorbası",
      "resim": "assets/images/yayla.jpg",
      "kategori": "Çorbalar",
      "sure": "50 Dakika",
      "malzemeler": [
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
      "yapilis": [
        "Su, sıvı yağ, tuz ve pirinçler tencereye alınır. Pirinçler yumuşayıncaya kadar kaynatılır.",
        "Ayrı bir kasede yoğurt, yumurta ve un, 1 su bardağına yakın su ile birlikte iyice çırpılır.",
        "Pirinçler yumuşayınca hızlıca karıştırarak yoğurtlu karışım çorbaya eklenir. Kaynayana kadar karıştırılır. Kaynayınca kısık ateşte 10-15 dk kaynatılır. Ara sıra karıştırmayı ihmal etmeyin.",
        "Çorbamız piştikten sonra altı kapatılır.",
        "Şık bir sunum olması açısından;",
        "Çorba kaselere alınır. Ayrı bir yerde tereyağı kızdırılarak nane ile karıştırılır. Ve kaselerdeki çorbaların üzerinde gezdirilir. Kalan naneli tereyağını tenceredeki çorbaya koyup karıştırın.",
        "Mis kokulu yayla çorbamız servise hazır."
      ]
    },
    {
      "isim": "Fırında Sütlaç",
      "resim": "assets/images/sütlac.jpg",
      "kategori": "Tatlılar",
      "sure": "1 Saat",
      "malzemeler": [
        "1 litre süt",
        "1 su bardağı şeker",
        "Yarım su bardağı pirinç",
        "3 yemek kaşığı buğday nişastası",
        "1 paket vanilya",
        "2 su bardağı su",
        "Yarım su bardağı süt (nişastayı açmak için)",
      ],
      "yapilis": [
        "Fırında sütlaç için öncelikle pirinci haşlayalım. Pirinçleri güzelce yıkadıktan sonra 2 su bardağı su ile pirinçler yumuşayıp pişene kadar haşlayın. Çok az sulu kalacaktır.",
        "Diğer malzemeleri ekleyelim ve sütlacı pişirelim. Haşlanan pirinçlerin üzerine sütü, vanilyayı ilave edip kaynatın.",
        "Bu arada bir kap içerisinde nişasta ve sütü (suyu) pürüzsüz kıvam alıncaya kadar karıştırın.",
        "Karışım kaynamaya başlayınca şekeri ve yarım su bardağı sütle karıştırdığınız 3 yemek kaşığı buğday nişastasını ilave ediniz. 10-15 dk. daha kaynatıp ocağın altını kapatın.",
        "Sütlaçları fırına sürelim. Fırın için uygun ısıya dayanıklı sütlaç kaselerine sütlaçlarınızı paylaştırın.",
        "Tepsinize soğuk su doldurun ve sütlaç kaplarını fırın tepsisine dizin (Tepsideki su sütlaç kaplarının yarısına kadar gelecek)",
        "Tepsiyi fırınınızın en üst rafına yerleştirin.",
        "180 derecede, sütlaçlarınız kızarana kadar fırınlayın. Afiyet olsun ",
      ]
    },
    {
      "isim": "Revani",
      "resim": "assets/images/revani.jpg",
      "kategori": "Tatlılar",
      "sure": "1 Saat 15 dakika",
      "malzemeler": [
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
      "yapilis": [
        "İlk olarak şerbet hazırlanır. Şerbet için tencereye şeker ve su alınarak kaynatılır. Kaynadıktan sonra yarım limon suyu eklenip 1-2 dakika daha kaynatılıp altı kapatılır.",
        "Kek için, yumurta ve şeker çırpma kabına alınarak iyice çırpılır.",
        "Ardından sıvı yağ, yoğurt ve irmik eklenip çırpılır.",
        "Son olarak un, kabartma tozu ve vanilya da eklenerek iyice çırpılır.",
        "Yağlamış olduğumuz fırın kabına kek hamuru dökülür.",
        "170 derece fırında üstü kızarana dek yaklaşık 30 dakika pişirilir.",
        "İlk sıcaklığı çıkan kek dilimlere kesilir ve sıcak kekin üstüne soğumuş şerbet dökülür.",
        "1-2 saat dinlendirdikten sonra üzeri isteğe göre krem şanti, hindistan cevizi yada fıstık vb. ile süslenerek servis edilir. Afiyet olsun.",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarif Atlası",
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
              title: const Text('Ana Yemekler'),
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
                children: yemekler.map((yemek) {
                  return _buildFoodCard(
                    context,
                    yemek["isim"],
                    yemek["sure"],
                    yemek["isim"],
                    yemek["resim"],
                  );
                }).toList(),
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
      onTap: () {
        final yemek = yemekler.firstWhere((yemek) => yemek["isim"] == title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TarifDetay(
              isim: yemek["isim"],
              malzemeler: List<String>.from(yemek["malzemeler"]),
              yapilis: List<String>.from(yemek["yapilis"]),
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(20.0),
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
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
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
