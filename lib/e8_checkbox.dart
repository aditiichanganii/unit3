import 'package:flutter/material.dart';

class E8Checkbox extends StatefulWidget {
  const E8Checkbox({super.key});

  @override
  State<E8Checkbox> createState() => _E8CheckboxState();
}

class _E8CheckboxState extends State<E8Checkbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkbox State")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isChecked ? "Checked" : "Unchecked",
              style: const TextStyle(fontSize: 24),
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
