import 'package:flutter/material.dart';

class SekreterDuyuruGoruntulemeSayfasi extends StatelessWidget {
  final List<String> duyurular;

  const SekreterDuyuruGoruntulemeSayfasi({super.key, required this.duyurular});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duyuruları Görüntüle',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Kavivanar',
          ),
        ),
        backgroundColor: const Color.fromRGBO(12, 19, 38, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Geri dön butonunun rengi beyaz
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: duyurular.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 23, 23).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                duyurular[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
