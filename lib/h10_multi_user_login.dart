import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String username;
  final String password;
  User(this.username, this.password);
}

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User("alice", "password123"),
    User("bob", "secure456"),
    User("charlie", "admin789"),
  ];

  bool validateUser(String username, String password) {
    return _users.any((u) => u.username == username && u.password == password);
  }
}

class H10MultiUserLogin extends StatefulWidget {
  const H10MultiUserLogin({super.key});

  @override
  State<H10MultiUserLogin> createState() => _H10MultiUserLoginState();
}

class _H10MultiUserLoginState extends State<H10MultiUserLogin> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Multi-user Login")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(builder: (context) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Username"),
                    validator: (v) => v!.isEmpty ? "Enter username" : null,
                    onSaved: (v) => _username = v ?? '',
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (v) => v!.isEmpty ? "Enter password" : null,
                    onSaved: (v) => _password = v ?? '',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final provider = Provider.of<UserProvider>(context, listen: false);
                        if (provider.validateUser(_username, _password)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Welcome back, $_username!")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid username or password")),
                          );
                        }
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
