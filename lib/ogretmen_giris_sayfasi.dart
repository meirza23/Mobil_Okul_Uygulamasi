import 'package:flutter/material.dart';
import 'ogretmen_sayfasi.dart';

class OgretmenGirisSayfasi extends StatefulWidget {
  @override
  _OgretmenGirisSayfasiState createState() => _OgretmenGirisSayfasiState();
}

class _OgretmenGirisSayfasiState extends State<OgretmenGirisSayfasi> {
  final TextEditingController _kullaniciAdController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  String _hataMesaji = '';

  void _girisYap() {
    String kullaniciAdi = _kullaniciAdController.text;
    String sifre = _sifreController.text;

    if (kullaniciAdi == 'ogretmen123' && sifre == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OgretmenSayfasi()),
      );
    } else {
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
          Image.asset(
            'assets/images/wallpaper.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage:
                      AssetImage('assets/images/istanbul-medeniyet.jpg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Öğretmen Giriş Sayfası',
                  style: TextStyle(
                    fontFamily: 'Kavivanar',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _kullaniciAdController,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _sifreController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (_hataMesaji.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _hataMesaji,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _girisYap,
                  child: const Text('Giriş Yap'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
