import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('GridView Example',style: TextStyle(color: Colors.white)),
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
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(12),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(12, (i) => Container(color: Colors.green.shade200, child: Center(child: Text('${i + 1}')))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
