import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TrapPage extends StatefulWidget {
  const TrapPage({super.key});

  @override
  State<TrapPage> createState() => _TrapPageState();
}

class _TrapPageState extends State<TrapPage> {
  List<dynamic> traps = [];

  @override
  void initState() {
    super.initState();
    loadTraps();
  }

  Future<void> loadTraps() async {
    String jsonString = await rootBundle.loadString('assets/data/products.json');
    List<dynamic> allProducts = json.decode(jsonString);
    setState(() {
      traps = allProducts.where((item) => item['category'] == 'Trap').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trap Waifus')),
      body: traps.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: traps.map((waifu) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.green[100],
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
