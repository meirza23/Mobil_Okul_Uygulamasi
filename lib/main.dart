import 'package:flutter/material.dart';
import 'ogrenci_giris_sayfasi.dart';
import 'ogretmen_giris_sayfasi.dart';
import 'sekreter_giris_sayfasi.dart';

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
                const Opacity(
                  opacity: 0.7,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AssetImage('assets/images/istanbul-medeniyet.jpg'),
                  ),
                ),
                const SizedBox(height: 20),
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OgrenciGirisSayfasi(),
                          ),
                        );
                      },
                      child: const Text(
                        'Öğrenci Girişi',
                        style: TextStyle(
                          fontFamily: 'Kavivanar',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OgretmenGirisSayfasi(),
                          ),
                        );
                      },
                      child: const Text(
                        'Öğretmen Girişi',
                        style: TextStyle(
                          fontFamily: 'Kavivanar',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SekreterGirisSayfasi(),
                          ),
                        );
                      },
                      child: const Text(
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
