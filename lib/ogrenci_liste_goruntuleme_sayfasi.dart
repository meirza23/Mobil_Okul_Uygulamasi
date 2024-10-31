import 'package:flutter/material.dart';

class OgrenciListeGoruntulemeSayfasi extends StatelessWidget {
  final List<String> gorevler;

  const OgrenciListeGoruntulemeSayfasi({super.key, required this.gorevler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste Görüntüle',
          style: TextStyle(
            color: Colors.white, // Yazı rengi beyaz
            fontFamily: 'Kavivanar', // Fontu Kavivanar olarak ayarlıyoruz
          ),
        ),
        backgroundColor: const Color.fromRGBO(12, 19, 38, 1), // Arka plan rengi
        elevation: 0, // Gölgelendirmeyi kaldır
        iconTheme: const IconThemeData(
          color: Colors.white, // Geri dön butonunun rengi beyaz
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/wallpaper3.jpg'), // Arka plan resmi
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: gorevler.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 23, 23)
                    .withOpacity(0.5), // Hafif şeffaf gri
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                gorevler[index],
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Lato' // Siyah yakın renk
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
