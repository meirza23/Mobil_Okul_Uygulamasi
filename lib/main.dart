import 'package:flutter/material.dart';
import 'OgrenciGirisSayfasi.dart'; // Öğrenci giriş sayfasını import edin
import 'OgretmenGirisSayfasi.dart'; // Öğretmen giriş sayfasını import edin
import 'SekreterGirisSayfasi.dart'; // Sekreter giriş sayfasını import edin

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
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
          // İçerik (şeffaflaştırılmış CircleAvatar ve butonlar)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Şeffaflaştırılmış CircleAvatar
                Opacity(
                  opacity: 0.7,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AssetImage('assets/images/istanbul-medeniyet.jpg'),
                  ),
                ),
                SizedBox(height: 20),
                // Öğrenci Girişi Butonu
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Öğrenci Giriş Sayfasına Geçiş
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OgrenciGirisSayfasi(),
                          ),
                        );
                      },
                      child: Text(
                        'Öğrenci Girişi',
                        style: TextStyle(
                          fontFamily: 'Kavivanar',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Öğretmen Girişi Butonu
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Öğretmen Giriş Sayfasına Geçiş
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OgretmenGirisSayfasi(),
                          ),
                        );
                      },
                      child: Text(
                        'Öğretmen Girişi',
                        style: TextStyle(
                          fontFamily: 'Kavivanar',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Sekreter Girişi Butonu
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Sekreter Giriş Sayfasına Geçiş
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SekreterGirisSayfasi(),
                          ),
                        );
                      },
                      child: Text(
                        'Sekreter Girişi',
                        style: TextStyle(
                          fontFamily: 'Kavivanar',
                          fontSize: 18,
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
