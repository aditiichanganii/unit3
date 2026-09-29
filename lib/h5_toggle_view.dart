import 'package:flutter/material.dart';

class H5ToggleView extends StatefulWidget {
  const H5ToggleView({super.key});

  @override
  State<H5ToggleView> createState() => _H5ToggleViewState();
}

class _H5ToggleViewState extends State<H5ToggleView> {
  bool _isGridView = false;
  final List<String> _data = List.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle List/Grid"),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          )
        ],
      ),
      body: _isGridView
          ? GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _data.length,
              itemBuilder: (context, i) => Card(child: Center(child: Text(_data[i]))),
            )
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(_data[i]),
                leading: const Icon(Icons.info),
              ),
            ),
    );
  }
}
