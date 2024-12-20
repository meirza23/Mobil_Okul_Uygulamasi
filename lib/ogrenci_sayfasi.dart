import 'package:flutter/material.dart';
import 'ogrenci_liste_olusturma_sayfasi.dart';
import 'ogrenci_liste_goruntuleme_sayfasi.dart';

class OgrenciSayfasi extends StatelessWidget {
  const OgrenciSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Sayfası'),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OgrenciListeOlusturmaSayfasi(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.red[400]?.withOpacity(0.7),
                    ),
                    child: const Opacity(
                      opacity: 0.85,
                      child: Text(
                        'Liste Oluştur',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OgrenciListeGoruntulemeSayfasi(
                            gorevler: [],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.red[400]?.withOpacity(0.7),
                    ),
                    child: const Opacity(
                      opacity: 0.85,
                      child: Text(
                        'Liste Görüntüle',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
