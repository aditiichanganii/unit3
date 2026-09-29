import 'package:flutter/material.dart';

class E6FormBasic extends StatefulWidget {
  const E6FormBasic({super.key});

  @override
  State<E6FormBasic> createState() => _E6FormBasicState();
}

class _E6FormBasicState extends State<E6FormBasic> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Enter something"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
