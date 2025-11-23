import 'package:flutter/material.dart';
import 'tsundere.dart';
import 'trap.dart';
import 'cegil.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final biarflutterpintardikit = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Toko Waifu Pak Slamet',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 5,
          children: [
            // Cewek Gila container -> CegilPage
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cewek Gila', style: biarflutterpintardikit),
                    Image.asset('assets/images/penyakityanderegila.gif'),
                    Text(
                      'Cocok untuk anda yang menyukai tantangan dan bosan dengan cewek yang gitu gitu aja, terutama fans yandere',
                    ),
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CegilPage()),
                            );
                          },
                          child: const Text('Lihat Semua Cegil Waifu'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Cewek Tsundere container -> TsunderePage
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cewek Tsundere', style: biarflutterpintardikit),
                    Image.asset('assets/images/penyakittsunderegila.gif'),
                    Text(
                      'Cocok untuk anda yang menyukai cewek jual mahal susah didapat dengan berbagai macam tantangan',
                    ),
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TsunderePage()),
                            );
                          },
                          child: const Text('Lihat Semua Tsundere'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Cwk Trap container -> TrapPage
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cwk Trap', style: biarflutterpintardikit),
                    Image.asset('assets/images/penyakitstresgila.gif'),
                    Text('Cocok untuk yang tau tau aja'),
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TrapPage()),
                            );
                          },
                          child: const Text('Lihat Semua Trap'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
