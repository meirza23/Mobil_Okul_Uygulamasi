import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset(
            'images/wallpaper.jpg',
            fit: BoxFit.cover, // Resmi tam ekran yapar
            width: double.infinity, // Genişliği tam ekran yapar
            height: double.infinity, // Yüksekliği tam ekran yapar
          ),
        ),
      ),
    ),
  );
}
