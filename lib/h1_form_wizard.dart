import 'package:flutter/material.dart';

class H1FormWizard extends StatefulWidget {
  const H1FormWizard({super.key});

  @override
  State<H1FormWizard> createState() => _H1FormWizardState();
}

class _H1FormWizardState extends State<H1FormWizard> {
  int _currentStep = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String _name = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi-step Form Wizard")),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 0) {
            if (_formKey1.currentState!.validate()) {
              setState(() => _currentStep++);
            }
          } else if (_currentStep == 1) {
            if (_formKey2.currentState!.validate()) {
              setState(() => _currentStep++);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Submitted!")));
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) setState(() => _currentStep--);
        },
        steps: [
          Step(
            title: const Text("Personal Info"),
            content: Form(
              key: _formKey1,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Full Name"),
                onChanged: (v) => _name = v,
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text("Address"),
            content: Form(
              key: _formKey2,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Home Address"),
                onChanged: (v) => _address = v,
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text("Review"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: $_name"),
                Text("Address: $_address"),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
