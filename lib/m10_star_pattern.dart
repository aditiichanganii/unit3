import 'package:flutter/material.dart';

class M10StarPattern extends StatefulWidget {
  const M10StarPattern({super.key});

  @override
  State<M10StarPattern> createState() => _M10StarPatternState();
}

class _M10StarPatternState extends State<M10StarPattern> {
  int _rows = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Star Pattern")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter number of rows"),
              onChanged: (value) {
                setState(() {
                  _rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(_rows, (index) {
                    return Text(
                      '* ' * (index + 1),
                      style: const TextStyle(fontSize: 20, fontFamily: 'monospace'),
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
