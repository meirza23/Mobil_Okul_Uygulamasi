import 'package:flutter/material.dart';
import 'ogrenci_liste_olusturma_sayfasi.dart';
import 'ogrenci_liste_goruntuleme_sayfasi.dart';

class OgretmenSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğretmen Sayfası'),
        backgroundColor: Colors.cyan[600],
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Opacity(
              opacity: 0.5,
              child: CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage('assets/images/istanbul-medeniyet.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/wallpaper2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Sayfa içeriği
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Öğretmen Giriş Başarılı!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                ),
                const SizedBox(
                    height: 30), // Metin ile butonlar arasında boşluk
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Liste Oluştur Butonu
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OgrenciListeOlusturmaSayfasi(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Kare buton
                        ),
                        padding: const EdgeInsets.all(20), // Büyütme
                        backgroundColor:
                            Colors.cyan.withOpacity(0.7), // Saydam yapma
                        minimumSize: const Size(150, 150), // Minimum boyut
                      ),
                      child: const Text(
                        'Liste Oluştur',
                        style: TextStyle(fontSize: 18), // Font boyutunu artır
                      ),
                    ),
                    const SizedBox(width: 20), // Butonlar arasında boşluk
                    // Liste Görüntüle Butonu
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OgrenciListeGoruntulemeSayfasi(
                              gorevler: [], // Başlangıçta boş liste
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Kare buton
                        ),
                        padding: const EdgeInsets.all(20), // Büyütme
                        backgroundColor:
                            Colors.cyan.withOpacity(0.7), // Saydam yapma
                        minimumSize: const Size(150, 150), // Minimum boyut
                      ),
                      child: const Text(
                        'Liste Görüntüle',
                        style: TextStyle(fontSize: 18), // Font boyutunu artır
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
