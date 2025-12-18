import 'package:flutter/material.dart';

class DisplayWidgetScreen extends StatelessWidget {
  final String title;
  const DisplayWidgetScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (title) {
      case 'Text':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Default Text'),
              SizedBox(height: 8),
              Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Italic Text', style: TextStyle(fontStyle: FontStyle.italic)),
              SizedBox(height: 8),
              Text('Large Text', style: TextStyle(fontSize: 24)),
              SizedBox(height: 8),
              SelectableText('Selectable text example — long press to copy.'),
            ],
          ),
        );
        break;

      case 'Image':
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Network image example
              SizedBox(
                width: 200,
                height: 140,
                child: Image.network(
                  'https://picsum.photos/400/300',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(child: Text('Network image failed')),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Image.network from picsum.photos'),
              const SizedBox(height: 18),

              // Asset image example (requires you to add the image file and register it in pubspec.yaml)
              SizedBox(
                width: 200,
                height: 140,
                child: Image.asset(
                  'assets/images/shinchan.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text('Asset not found. Add assets/images/shinchan.png and register in pubspec.yaml'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Image.asset (assets/images/shinchan.png)'),
            ],
          ),
        );
        break;

      case 'Icon':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            children: const [
              Icon(Icons.favorite, color: Colors.red, size: 32),
              Icon(Icons.star, color: Colors.amber, size: 36),
              Icon(Icons.settings, color: Colors.grey, size: 28),
              Icon(Icons.phone, color: Colors.green, size: 30),
            ],
          ),
        );
        break;

      case 'Card':
        body = Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('Card title'),
                  subtitle: const Text('This is a subtitle of the card.'),
                  trailing: IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: const [Icon(Icons.info), SizedBox(width: 12), Expanded(child: Text('Informational card with an icon.'))],
                  ),
                ),
              ),
            ],
          ),
        );
        break;

      default:
        body = Center(child: Text('Demo: $title', style: const TextStyle(fontSize: 20)));
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(child: body),
    );
  }
}
