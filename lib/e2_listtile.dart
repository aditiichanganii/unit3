import 'package:flutter/material.dart';

class E2ListTile extends StatelessWidget {
  const E2ListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => "Item ${index + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text("ListView with ListTile")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: Text(items[index]),
            subtitle: Text("Subtitle for item ${index + 1}"),
            onTap: () {},
          );
        },
      ),
    );
  }
}
