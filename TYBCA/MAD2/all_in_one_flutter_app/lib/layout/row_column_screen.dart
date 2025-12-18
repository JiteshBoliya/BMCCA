import 'package:flutter/material.dart';

class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column Example')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Icon(Icons.star), Icon(Icons.favorite), Icon(Icons.thumb_up)],
            ),
            const SizedBox(height: 24),
            const Text('A Column with a Row above', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
