import 'package:flutter/material.dart';
import 'ogrenci_liste_goruntuleme_sayfasi.dart';

class OgrenciListeOlusturmaSayfasi extends StatefulWidget {
  const OgrenciListeOlusturmaSayfasi({super.key});

  @override
  _ListeOlusturmaSayfasiState createState() => _ListeOlusturmaSayfasiState();
}

class _ListeOlusturmaSayfasiState extends State<OgrenciListeOlusturmaSayfasi> {
  final List<String> _gorevler = [];
  final TextEditingController _controller = TextEditingController();

  void _ekleGorev() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _gorevler.add(_controller.text);
        _controller.clear(); // Görev eklendikten sonra input alanını temizle
      });
    }
  }

  void _goruntuleGorevler() {
    if (_gorevler.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OgrenciListeGoruntulemeSayfasi(gorevler: _gorevler),
        ),
      );
    } else {
      // Liste boşsa kullanıcıya bir mesaj göster
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Görev listesi boş!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste Oluştur',
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
            fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white), // Yazı rengi beyaz
              decoration: InputDecoration(
                labelText: 'Görev Ekle',
                labelStyle:
                    const TextStyle(color: Colors.white), // Label rengi beyaz
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed:
                      _ekleGorev, // Görev ekleme işlemi burada gerçekleşir
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _goruntuleGorevler, // Görevleri görüntüleme butonu
              child: const Text('Görevleri Görüntüle'),
            ),
            const SizedBox(height: 16.0), // Alan yaratmak için
            Expanded(
              child: ListView.builder(
                itemCount: _gorevler.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0), // Kutu arasındaki boşluk
                    padding: const EdgeInsets.all(16.0), // Kutu içindeki boşluk
                    decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 221, 23, 23), // Kutu rengi
                      borderRadius:
                          BorderRadius.circular(10.0), // Köşe yuvarlama
                    ),
                    child: Text(
                      _gorevler[index],
                      style: const TextStyle(
                          color: Colors.white), // Yazı rengi beyaz
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
