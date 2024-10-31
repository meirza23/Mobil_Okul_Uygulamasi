import 'package:flutter/material.dart';

class OgretmenSayfasi extends StatefulWidget {
  @override
  _OgretmenSayfasiState createState() => _OgretmenSayfasiState();
}

class _OgretmenSayfasiState extends State<OgretmenSayfasi> {
  final TextEditingController _vizeController = TextEditingController();
  final TextEditingController _finalController = TextEditingController();
  double? ortalama;

  void _ortalamaHesapla() {
    double vize = double.tryParse(_vizeController.text) ?? 0;
    double finalNotu = double.tryParse(_finalController.text) ?? 0;
    setState(() {
      ortalama = (vize * 0.4) + (finalNotu * 0.6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Öğretmen Sayfası',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Kavivanar',
          ),
        ),
        backgroundColor: const Color.fromRGBO(12, 19, 38, 1),
        elevation: 0,
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
              controller: _vizeController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Vize Notu',
                labelStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _finalController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Final Notu',
                labelStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 23, 23),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _ortalamaHesapla,
              child: const Text(
                'Ortalama Hesapla',
                style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
            const SizedBox(height: 20),
            if (ortalama != null)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 221, 23, 23).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Ortalama: ${ortalama!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
