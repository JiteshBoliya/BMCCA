import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Example')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 20,
        itemBuilder: (context, i) => Card(margin: const EdgeInsets.symmetric(vertical: 6), child: ListTile(title: Text('Item #${i + 1}'))),
      ),
    );
  }
}
