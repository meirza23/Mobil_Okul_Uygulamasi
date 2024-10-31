import 'package:flutter/material.dart';
import 'sekreter_duyuru_olusturma_sayfasi.dart';
import 'sekreter_duyuru_goruntuleme_sayfasi.dart';

class SekreterSayfasi extends StatelessWidget {
  const SekreterSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sekreter Sayfası'),
        backgroundColor: Colors.cyan[600],
        actions: const [
          Padding(
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Butonları yatayda ortalar
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SekreterDuyuruOlusturmaSayfasi(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.blue[400]?.withOpacity(0.7),
                        ),
                        child: Center(
                          // Metni yatayda ortalamak için Center kullan
                          child: const Opacity(
                            opacity: 0.85,
                            child: Text(
                              'Duyuru Oluştur',
                              textAlign: TextAlign.center, // Metni ortala
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Butonlar arasındaki boşluk
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SekreterDuyuruGoruntulemeSayfasi(
                                      duyurular: []),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.blue[400]?.withOpacity(0.7),
                        ),
                        child: Center(
                          // Metni yatayda ortalamak için Center kullan
                          child: const Opacity(
                            opacity: 0.85,
                            child: Text(
                              'Duyuruları Görüntüle',
                              textAlign: TextAlign.center, // Metni ortala
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
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
