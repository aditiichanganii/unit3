import 'package:flutter/material.dart';

class M6LoginForm extends StatefulWidget {
  const M6LoginForm({super.key});

  @override
  State<M6LoginForm> createState() => _M6LoginFormState();
}

class _M6LoginFormState extends State<M6LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    if (_usernameController.text == "admin" && _passwordController.text == "123456") {
      setState(() {
        _errorMessage = null;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const M6HomeScreen()),
      );
    } else {
      setState(() {
        _errorMessage = "Wrong credentials! Use admin / 123456";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 10),
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class M6HomeScreen extends StatelessWidget {
  const M6HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Center(child: Text("Welcome, Admin!", style: TextStyle(fontSize: 24))),
    );
  }
}
