import 'package:flutter/material.dart';

class M2SearchFilter extends StatefulWidget {
  const M2SearchFilter({super.key});

  @override
  State<M2SearchFilter> createState() => _M2SearchFilterState();
}

class _M2SearchFilterState extends State<M2SearchFilter> {
  final List<String> _allNames = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape", "Honeydew"];
  List<String> _filteredNames = [];

  @override
  void initState() {
    super.initState();
    _filteredNames = _allNames;
  }

  void _filterList(String query) {
    setState(() {
      _filteredNames = _allNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Filter")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterList,
              decoration: const InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNames.length,
              itemBuilder: (context, index) => ListTile(title: Text(_filteredNames[index])),
            ),
          ),
        ],
      ),
    );
  }
}
