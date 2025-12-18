import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Example')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(16)),
          child: const Center(child: Text('Container', style: TextStyle(color: Colors.white, fontSize: 18))),
        ),
      ),
    );
  }
}
