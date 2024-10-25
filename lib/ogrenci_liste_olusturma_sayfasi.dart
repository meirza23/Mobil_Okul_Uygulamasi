import 'package:flutter/material.dart';
import 'ogrenci_liste_goruntuleme_sayfasi.dart';

class OgrenciListeOlusturmaSayfasi extends StatefulWidget {
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
        title: const Text('Liste Oluştur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Görev Ekle',
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
            Expanded(
              child: ListView.builder(
                itemCount: _gorevler.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_gorevler[index]),
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
