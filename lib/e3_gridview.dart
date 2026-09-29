import 'package:flutter/material.dart';

class E3GridView extends StatelessWidget {
  const E3GridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red, Colors.green, Colors.blue,
      Colors.yellow, Colors.orange, Colors.purple
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("6 Colored Boxes")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            child: Center(
              child: Text(
                "Box ${index + 1}",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
