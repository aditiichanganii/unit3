import 'package:flutter/material.dart';

class M4HomeScreen extends StatelessWidget {
  const M4HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pop Data Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const M4DetailScreen()),
            );
            if (context.mounted && result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Received: $result')),
              );
            }
          },
          child: const Text("Go to Detail Screen"),
        ),
      ),
    );
  }
}

class M4DetailScreen extends StatelessWidget {
  const M4DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, "Hello from Detail Screen!");
          },
          child: const Text("Return with Data"),
        ),
      ),
    );
  }
}
