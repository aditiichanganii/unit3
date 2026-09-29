import 'package:flutter/material.dart';

class H9NestedNav extends StatefulWidget {
  const H9NestedNav({super.key});

  @override
  State<H9NestedNav> createState() => _H9NestedNavState();
}

class _H9NestedNavState extends State<H9NestedNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          TabNavigator(tabName: "Home", color: Colors.blue),
          TabNavigator(tabName: "Settings", color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final String tabName;
  final Color color;
  const TabNavigator({super.key, required this.tabName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text("$tabName Root"), backgroundColor: color),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text("$tabName Detail"), backgroundColor: color),
                        body: const Center(child: Text("Nested Screen Content")),
                      ),
                    ),
                  );
                },
                child: const Text("Go Deeper"),
              ),
            ),
          ),
        );
      },
    );
  }
}
