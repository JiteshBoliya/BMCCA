import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Container Example',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        elevation: 0,
        // centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromARGB(255,154,207,250), Color(0xFF42A5F5)]),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 100, 12, 12),
            child: Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(16)),
                    child: const Center(child: Text('Container', style: TextStyle(color: Colors.white, fontSize: 18))),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
