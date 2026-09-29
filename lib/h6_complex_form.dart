import 'package:flutter/material.dart';

class H6ComplexForm extends StatefulWidget {
  const H6ComplexForm({super.key});

  @override
  State<H6ComplexForm> createState() => _H6ComplexFormState();
}

class _H6ComplexFormState extends State<H6ComplexForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _role = 'Developer';
  bool _agreed = false;

  void _submit() {
    if (_formKey.currentState!.validate() && _agreed) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => H6SummaryScreen(name: _name, role: _role, agreed: _agreed),
        ),
      );
    } else if (!_agreed) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Accept terms!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complex Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                onSaved: (v) => _name = v ?? '',
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
              DropdownButtonFormField<String>(
                value: _role,
                items: ['Developer', 'Designer', 'Manager'].map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                onChanged: (v) => setState(() => _role = v!),
                decoration: const InputDecoration(labelText: "Role"),
              ),
              CheckboxListTile(
                title: const Text("I agree to terms"),
                value: _agreed,
                onChanged: (v) => setState(() => _agreed = v!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text("Show Summary")),
            ],
          ),
        ),
      ),
    );
  }
}

class H6SummaryScreen extends StatelessWidget {
  final String name, role;
  final bool agreed;
  const H6SummaryScreen({super.key, required this.name, required this.role, required this.agreed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Summary")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name"),
            Text("Role: $role"),
            Text("Agreed: ${agreed ? 'Yes' : 'No'}"),
          ],
        ),
      ),
    );
  }
}
