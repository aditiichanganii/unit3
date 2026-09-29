import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class E9ProviderCounter extends StatelessWidget {
  const E9ProviderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text("ChangeNotifier & Consumer")),
        body: Center(
          child: Consumer<CounterModel>(
            builder: (context, counter, child) {
              return Text(
                'Counter: ${counter.count}',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: Consumer<CounterModel>(
          builder: (context, counter, child) {
            return FloatingActionButton(
              onPressed: () => counter.increment(),
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
