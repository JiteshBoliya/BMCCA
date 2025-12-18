import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Example')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(12),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(12, (i) => Container(color: Colors.green.shade200, child: Center(child: Text('${i + 1}')))),
      ),
    );
  }
}
