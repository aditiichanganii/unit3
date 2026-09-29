import 'package:flutter/material.dart';

class E1ListView extends StatelessWidget {
  const E1ListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      "Alice", "Bob", "Charlie", "David", "Eve", 
      "Frank", "Grace", "Heidi", "Ivan", "Judy"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("10 Fixed Names")),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(names[index], style: const TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
