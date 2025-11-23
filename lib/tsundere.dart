import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'detail_page.dart';

class TsunderePage extends StatefulWidget {
  const TsunderePage({super.key});

  @override
  State<TsunderePage> createState() => _TsunderePageState();
}

class _TsunderePageState extends State<TsunderePage> {
  List<dynamic> tsunderes = [];

  @override
  void initState() {
    super.initState();
    loadTsunderes();
  }

  Future<void> loadTsunderes() async {
    String jsonString = await rootBundle.loadString('assets/data/products.json');
    List<dynamic> allProducts = json.decode(jsonString);
    setState(() {
      tsunderes = allProducts.where((item) => item['category'] == 'Tsundere').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tsundere Waifus')),
      body: tsunderes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: tsunderes.map((waifu) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(waifu: waifu),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/${waifu['imageid']}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        waifu['waifuname'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '\$${waifu['price']}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
