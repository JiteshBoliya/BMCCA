import 'package:flutter/material.dart';

class DialView extends StatelessWidget {
  final String number;
  final String name;
  const DialView({super.key, required this.number, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const SizedBox(height: 40),
              CircleAvatar(radius: 48, backgroundColor: Colors.grey[800], child: const Icon(Icons.person, size: 56, color: Colors.white)),
              const SizedBox(height: 12),
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 22)),
              const SizedBox(height: 6),
              Text(number, style: const TextStyle(color: Colors.white70)),
            ]),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.grey[800],
                  child: const Icon(Icons.volume_up),
                ),
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end),
                ),
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.grey[800],
                  child: const Icon(Icons.mic),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
