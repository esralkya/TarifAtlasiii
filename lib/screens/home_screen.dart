import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';  // GoRouter'ı kullanabilmek için import
import '../tarif_detay.dart'; // Tarif detayına yönlendirmek için import

class AnaSayfa extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  AnaSayfa({required this.isDarkMode, required this.toggleTheme});

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _selectedCategoryIndex = -1;
  String _searchQuery = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      "sure": "25 Dakika",
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
    {
      "isim": "Pankek",
      "resim": "assets/images/pancake.jpg",
      "kategori": "Tatlılar",
      "sure": "15 Dakika",
      "malzemeler": [
        "2 adet yumurta",
        "2 yemek kaşığı şeker",
        "1 su bardağı süt",
        "1,5 su bardağı un",
        "1 paket kabartma tozu",
        "1 paket vanilya",
        "Servis önerisi:",
        "Kivi, muz, çilek, reçel, bal, çikolata",
      ],
      "yapilis": [
        "Pankek yapmak için öncelikle yumurtalar ve şekeri uygun bir karıştırma kabına alarak iyice çırpalım.",
        "Süt, un, kabartma tozu, vanilya ilave çırpma teli ile çırpalım. Siz dilerseniz mikser ile de çırpabilirsiniz. Kek kıvamından biraz daha koyu olacak şekilde hamur hazırlayalım.",
        "Teflon ya da yapışmaz bir tavaya az sıvı yağı dökelim, fırça yardımı ile her tarafına dağıtalım. Sıvı yağı az kullanmak pankek yapmanın püf noktalarındandır. Dilerseniz peçete ile de tavaya dağıtabilirsiniz.",
        "1 büyük kaşık hamur dökülerek hamurun kendi kendine yayılmasını bekleyelim.",
        "Üzeri göz göz olmaya başlayan pankeklerimizi spatula yardımı ile ters çevirelim. Diğer taraflarını da pişirelim.",
        "Her iki tarafı da pişen pankeklerimizi servis tabağına alalım.",
        "Üzerine  pudra şekeri serpilerek zevkinize göre muz, kivi, çilek, çikolata, bal, sürülebilir çikolata, reçel ile servis edebilirsiniz.",
      ]
    },
  ];
  
  final List<Map<String, dynamic>> kategoriler = [
    {"isim": "Ana Yemekler", "ikon": Icons.fastfood},
    {"isim": "Çorbalar", "ikon": Icons.ramen_dining},
    {"isim": "Salatalar", "ikon": Icons.local_dining},
    {"isim": "Tatlılar", "ikon": Icons.cake},
  ];

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _onHomeSelected() {
    setState(() {
      _selectedCategoryIndex = -1;
    });
    Navigator.pop(context); // Menü kapanacak
  }

  List<Map<String, dynamic>> _getFilteredYemekler() {
    List<Map<String, dynamic>> filteredYemekler = yemekler;

    if (_selectedCategoryIndex != -1) {
      filteredYemekler = yemekler.where((yemek) {
        return yemek['kategori'] == kategoriler[_selectedCategoryIndex]['isim'];
      }).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filteredYemekler = filteredYemekler.where((yemek) {
        return yemek['isim']!.toLowerCase().contains(_searchQuery);
      }).toList();
    }

    return filteredYemekler;
  }

  @override
  Widget build(BuildContext context) {
    final filteredYemekler = _getFilteredYemekler();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Tarif Atlası',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          GestureDetector(
            onTap: widget.toggleTheme,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.grey : Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 221, 24, 10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 6, 6),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Menü',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Ana Sayfa', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ...List.generate(kategoriler.length, (index) {
                return ListTile(
                  onTap: () {
                    _onCategorySelected(index);
                    Navigator.pop(context);
                  },
                  leading: Icon(kategoriler[index]['ikon'], color: Colors.white),
                  title: Text(
                    kategoriler[index]['isim'],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Yemek ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                  _selectedCategoryIndex = -1;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredYemekler.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final yemek = filteredYemekler[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TarifDetay(
                          yemekAdi: yemek['isim'],
                          resim: yemek['resim'],
                          sure: yemek['sure'],
                          malzemeler: List<String>.from(yemek['malzemeler']),
                          yapilis: List<String>.from(yemek['yapilis']),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            yemek['resim'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            yemek['isim'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}