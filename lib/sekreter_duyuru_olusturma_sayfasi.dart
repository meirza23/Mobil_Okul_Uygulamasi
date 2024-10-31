import 'package:flutter/material.dart';
import 'sekreter_duyuru_goruntuleme_sayfasi.dart';

class SekreterDuyuruOlusturmaSayfasi extends StatefulWidget {
  @override
  _SekreterDuyuruOlusturmaSayfasiState createState() =>
      _SekreterDuyuruOlusturmaSayfasiState();
}

class _SekreterDuyuruOlusturmaSayfasiState
    extends State<SekreterDuyuruOlusturmaSayfasi> {
  final List<String> _duyurular = [];
  final TextEditingController _duyuruController = TextEditingController();

  void _duyuruEkle() {
    if (_duyuruController.text.isNotEmpty) {
      setState(() {
        _duyurular.add(_duyuruController.text);
        _duyuruController.clear();
      });
    }
  }

  void _duyurulariGoruntule() {
    if (_duyurular.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SekreterDuyuruGoruntulemeSayfasi(duyurular: _duyurular),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Duyuru listesi boş!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duyuru Oluştur',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Kavivanar',
          ),
        ),
        backgroundColor: const Color.fromRGBO(12, 19, 38, 1),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _duyuruController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Duyuru/Haber Ekle',
                labelStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _duyuruEkle,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20), // "Duyuru Ekle" butonunu kaldırdık
            ElevatedButton(
              onPressed: _duyurulariGoruntule,
              child: const Text('Duyuruları Görüntüle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 23, 23),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _duyurular.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 23, 23),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      _duyurular[index],
                      style: const TextStyle(color: Colors.white),
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
