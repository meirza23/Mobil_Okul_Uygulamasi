import 'package:flutter/material.dart';
import 'OgrenciSayfasi.dart'; // OgrenciSayfasi'na yönlendirme için import ettik

class OgrenciGirisSayfasi extends StatefulWidget {
  @override
  _OgrenciGirisSayfasiState createState() => _OgrenciGirisSayfasiState();
}

class _OgrenciGirisSayfasiState extends State<OgrenciGirisSayfasi> {
  final TextEditingController _kullaniciAdController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  String _hataMesaji = ''; // Hata mesajı için değişken

  void _girisYap() {
    String kullaniciAdi = _kullaniciAdController.text;
    String sifre = _sifreController.text;

    // Kullanıcı adı ve şifre kontrolü
    if (kullaniciAdi == 'ogrenci123' && sifre == '123') {
      // Bilgiler doğru ise OgrenciSayfasi'na yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OgrenciSayfasi()),
      );
    } else {
      // Hata mesajı göster
      setState(() {
        _hataMesaji = 'Kullanıcı adı veya şifre hatalı!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Image.asset(
            'assets/images/wallpaper.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // İçerik
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar
                CircleAvatar(
                  radius: 90,
                  backgroundImage:
                      AssetImage('assets/images/istanbul-medeniyet.jpg'),
                ),
                SizedBox(height: 20),
                // Sayfa Başlığı
                Text(
                  'Öğrenci Giriş Sayfası',
                  style: TextStyle(
                    fontFamily: 'Kavivanar',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                // Kullanıcı adı alanı
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _kullaniciAdController,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Şifre alanı
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _sifreController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Hata mesajı
                if (_hataMesaji.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16), // İçerideki boşluk
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.9), // Arka plan rengi
                      borderRadius: BorderRadius.circular(8), // Kenar yuvarlama
                    ),
                    child: Text(
                      _hataMesaji,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Yazı boyutu
                      ),
                      textAlign: TextAlign.center, // Metin ortalama
                    ),
                  ),
                SizedBox(height: 20),
                // Giriş butonu
                ElevatedButton(
                  onPressed: _girisYap,
                  child: Text('Giriş Yap'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
