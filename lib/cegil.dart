import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CegilPage extends StatefulWidget {
  const CegilPage({super.key});

  @override
  State<CegilPage> createState() => _CegilPageState();
}

class _CegilPageState extends State<CegilPage> {
  List<dynamic> cegils = [];

  @override
  void initState() {
    super.initState();
    loadCegils();
  }

  Future<void> loadCegils() async {
    String jsonString = await rootBundle.loadString('assets/data/products.json');
    List<dynamic> allProducts = json.decode(jsonString);
    setState(() {
      cegils = allProducts.where((item) => item['category'] == 'Cegil Waifu').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cegil Waifus')),
      body: cegils.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: cegils.map((waifu) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/${waifu['imageid']}',
                          fit: BoxFit.cover,
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
