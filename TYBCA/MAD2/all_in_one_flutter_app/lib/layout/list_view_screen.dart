import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('ListView Example',style: TextStyle(color: Colors.white)),
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
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: 20,
                itemBuilder: (context, i) => Card(margin: const EdgeInsets.symmetric(vertical: 6), child: ListTile(title: Text('Item #${i + 1}'))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
