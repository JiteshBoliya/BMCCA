import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Example')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 220, height: 220, color: Colors.purple.shade100),
            Container(width: 160, height: 160, color: Colors.purple.shade300),
            const Text('Stack', style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
