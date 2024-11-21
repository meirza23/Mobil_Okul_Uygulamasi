import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'ogrenci_sayfasi.dart';
import 'ogretmen_sayfasi.dart';
import 'sekreter_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _kullaniciAdiController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  Future<void> _girisYap(BuildContext context) async {
    final String kullaniciAdi = _kullaniciAdiController.text;
    final String sifre = _sifreController.text;

    // Veritabanını açma ve kontrol işlemi
    final dbPath = await getDatabasesPath();
    final database = await openDatabase(
      join(dbPath, 'kullanici_veritabani.db'),
    );

    final result = await database.query(
      'kullanicilar',
      where: 'kullanici_adi = ? AND sifre = ?',
      whereArgs: [kullaniciAdi, sifre],
    );

    if (result.isNotEmpty) {
      final rol = result.first['rol'];

      if (rol == 'ogrenci') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OgrenciSayfasi()),
        );
      } else if (rol == 'ogretmen') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OgretmenSayfasi()),
        );
      } else if (rol == 'sekreter') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SekreterSayfasi()),
        );
      }
    } else {
      // Hatalı giriş durumunda kullanıcıya mesaj göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hatalı kullanıcı adı veya şifre')),
      );
    }

    await database.close();
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AssetImage('assets/images/istanbul-medeniyet.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _kullaniciAdiController,
                          decoration:
                              const InputDecoration(labelText: 'Kullanıcı Adı'),
                        ),
                        TextField(
                          controller: _sifreController,
                          obscureText: true,
                          decoration: const InputDecoration(labelText: 'Şifre'),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => _girisYap(context),
                          child: const Text('Giriş Yap'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
