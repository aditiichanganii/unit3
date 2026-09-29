import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

class E10ProviderReadWatch extends StatelessWidget {
  const E10ProviderReadWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Read vs Watch")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CounterDisplay(),
              const SizedBox(height: 20),
              const IncrementButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});
  @override
  Widget build(BuildContext context) {
    // context.watch() makes the widget rebuild when count changes
    final count = context.watch<Counter>().count;
    return Text("Count: $count", style: const TextStyle(fontSize: 24));
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.read() is used for one-time access (actions) without rebuilding
        context.read<Counter>().increment();
      },
      child: const Text("Increment (read)"),
    );
  }
}
