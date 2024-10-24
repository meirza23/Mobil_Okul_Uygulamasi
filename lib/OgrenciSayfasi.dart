import 'package:flutter/material.dart';

class OgrenciSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Sayfası'),
        backgroundColor: Colors.cyan[600], // AppBar arka plan rengi
        actions: [
          // Yarı şeffaf daire şeklinde logo ekleme
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Opacity(
              opacity: 0.5, // Şeffaflık seviyesi
              child: CircleAvatar(
                radius: 20, // Daire boyutu
                backgroundImage: AssetImage(
                    'assets/images/istanbul-medeniyet.jpg'), // Logo resmi
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Image.asset(
            'assets/images/wallpaper2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Ortada metin
          Center(
            child: Text(
              'Öğrenci Giriş Başarılı!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // Yazı rengi beyaz
                fontFamily: 'Lato', // Lato fontu
              ),
            ),
          ),
        ],
      ),
    );
  }
}
