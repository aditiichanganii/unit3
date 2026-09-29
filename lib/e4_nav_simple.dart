import 'package:flutter/material.dart';

class E4HomeScreen extends StatelessWidget {
  const E4HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const E4SecondScreen()),
            );
          },
          child: const Text("Go to Second Screen"),
        ),
      ),
    );
  }
}

class E4SecondScreen extends StatelessWidget {
  const E4SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
