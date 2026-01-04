import 'package:flutter/material.dart';
import 'image_model.dart';

class ImagePreviewScreen extends StatelessWidget {
  final ImageItem item;
  const ImagePreviewScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white)),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: Image.asset(item.source, fit: BoxFit.contain))),
            Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('Modified: ${item.modifiedDate}', style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 4),
                Text('Size: ${item.size} • Type: ${item.type}', style: const TextStyle(color: Colors.white70)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
