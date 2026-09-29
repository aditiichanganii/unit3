import 'package:flutter/material.dart';

class H8PyramidPattern extends StatefulWidget {
  const H8PyramidPattern({super.key});

  @override
  State<H8PyramidPattern> createState() => _H8PyramidPatternState();
}

class _H8PyramidPatternState extends State<H8PyramidPattern> {
  int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pyramid Pattern")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter N for Pyramid"),
              onChanged: (value) {
                setState(() {
                  _n = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(_n, (i) {
                    String rowText = List.generate(i + 1, (j) => "${i + 1}").join(" ");
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        rowText,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
