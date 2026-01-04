import 'package:flutter/material.dart';

class DisplayWidgetScreen extends StatefulWidget {
  final String title;
  const DisplayWidgetScreen({super.key, required this.title});

  @override
  State<DisplayWidgetScreen> createState() => _DisplayWidgetScreenState();
}

class _DisplayWidgetScreenState extends State<DisplayWidgetScreen> {
  // Text settings
  double textSize = 16;
  bool textBold = false;
  bool textItalic = false;
  Color textColor = Colors.black;

  // Image settings
  bool imageUseNetwork = true;
  BoxFit imageFit = BoxFit.cover;
  double imageWidth = 200;
  double imageHeight = 140;

  // Icon settings
  double iconSize = 32;
  Color iconColor = Colors.red;

  // Card settings
  double cardElevation = 4;
  Color cardColor = Colors.white;
  bool cardShowTrailing = true;

  void _showInfo() {
    final title = widget.title;
    showDialog(
      context: context,
      builder: (context) {
        Widget content;
        switch (title) {
          case 'Text':
            content = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Text widget displays a string of text in a single style.'),
                  SizedBox(height: 8),
                  Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('• data — the string to display'),
                  Text('• style — fontSize, color, weight, style'),
                  Text('• textAlign — alignment within its bounds'),
                  Text('• maxLines / overflow — control wrapping/truncation'),
                ],
              ),
            );
            break;
          case 'Image':
            content = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Image displays visual content from assets or network.'),
                  SizedBox(height: 8),
                  Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('• source — Image.asset or Image.network'),
                  Text('• fit — BoxFit to control scaling'),
                  Text('• width / height — dimensions'),
                  Text('• errorBuilder — handle loading failures'),
                ],
              ),
            );
            break;
          case 'Icon':
            content = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Icon displays a glyph from MaterialIcons.'),
                  SizedBox(height: 8),
                  Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('• icon — the icon data (Icons.*)'),
                  Text('• size — logical pixel size'),
                  Text('• color — icon color'),
                ],
              ),
            );
            break;
          case 'Card':
          default:
            content = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Card is used to present related information with elevation.'),
                  SizedBox(height: 8),
                  Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('• elevation — z-coordinate shadow'),
                  Text('• color — background color'),
                  Text('• shape — borderRadius and shape'),
                  Text('• child — usually a ListTile or content widgets'),
                ],
              ),
            );
        }

        return AlertDialog(
          title: Text('$title Widget'),
          content: content,
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
        );
      },
    );
  }

  void _openSettings() {
    final title = widget.title;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(builder: (context, setModalState) {
            Widget content;
            switch (title) {
              case 'Text':
                content = SizedBox(
                  height: 340,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(title: Text('Text Settings')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Font size'), Text(textSize.toStringAsFixed(0))]),
                          Slider(min: 8, max: 48, value: textSize, onChanged: (v) { setState(() => textSize = v); setModalState(() {}); }),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Bold'), Switch(value: textBold, onChanged: (v) { setState(() => textBold = v); setModalState(() {}); })]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Italic'), Switch(value: textItalic, onChanged: (v) { setState(() => textItalic = v); setModalState(() {}); })]),
                          const SizedBox(height: 8),
                          Row(children: [const Text('Color:'), const SizedBox(width: 8), GestureDetector(onTap: () { setState(() => textColor = Colors.black); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.black)), const SizedBox(width: 6), GestureDetector(onTap: () { setState(() => textColor = Colors.blue); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.blue)), GestureDetector(onTap: () { setState(() => textColor = Colors.red); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.red)),]),
                          const SizedBox(height: 12),
                          Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                        ]),
                      )
                    ],
                  ),
                );
                break;
              case 'Image':
                content = SizedBox(
                  height: 380,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const ListTile(title: Text('Image Settings')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Use network'), Switch(value: imageUseNetwork, onChanged: (v) { setState(() => imageUseNetwork = v); setModalState(() {}); })]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Fit'), DropdownButton<BoxFit>(value: imageFit, items: [BoxFit.cover, BoxFit.contain, BoxFit.fill, BoxFit.fitWidth, BoxFit.fitHeight].map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(), onChanged: (v) { if (v == null) return; setState(() => imageFit = v); setModalState(() {}); })]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Width'), Text(imageWidth.toStringAsFixed(0))]),
                        Slider(min: 80, max: 400, value: imageWidth, onChanged: (v) { setState(() => imageWidth = v); setModalState(() {}); }),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Height'), Text(imageHeight.toStringAsFixed(0))]),
                        Slider(min: 60, max: 400, value: imageHeight, onChanged: (v) { setState(() => imageHeight = v); setModalState(() {}); }),
                        const SizedBox(height: 12),
                        Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                      ]),
                    )
                  ]),
                );
                break;
              case 'Icon':
                content = SizedBox(
                  height: 300,
                  child: Column(children: [
                    const ListTile(title: Text('Icon Settings')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Size'), Text(iconSize.toStringAsFixed(0))]),
                        Slider(min: 8, max: 96, value: iconSize, onChanged: (v) { setState(() => iconSize = v); setModalState(() {}); }),
                        const SizedBox(height: 8),
                        Row(children: [const Text('Color:'), const SizedBox(width: 8), GestureDetector(onTap: () { setState(() => iconColor = Colors.red); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.red)), const SizedBox(width: 6), GestureDetector(onTap: () { setState(() => iconColor = Colors.amber); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.amber)), GestureDetector(onTap: () { setState(() => iconColor = Colors.green); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.green)),]),
                        const SizedBox(height: 12),
                        Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                      ]),
                    )
                  ]),
                );
                break;
              case 'Card':
              default:
                content = SizedBox(
                  height: 320,
                  child: Column(children: [
                    const ListTile(title: Text('Card Settings')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Elevation'), Text(cardElevation.toStringAsFixed(0))]),
                        Slider(min: 0, max: 16, value: cardElevation, onChanged: (v) { setState(() => cardElevation = v); setModalState(() {}); }),
                        const SizedBox(height: 8),
                        Row(children: [const Text('Color:'), const SizedBox(width: 8), GestureDetector(onTap: () { setState(() => cardColor = Colors.white); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.white)), const SizedBox(width: 6), GestureDetector(onTap: () { setState(() => cardColor = Colors.blue.shade50); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.blue.shade50)), GestureDetector(onTap: () { setState(() => cardColor = Colors.grey.shade200); setModalState(() {}); }, child: Container(width: 28, height: 20, color: Colors.grey.shade200)),]),
                        const SizedBox(height: 8),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Show trailing'), Switch(value: cardShowTrailing, onChanged: (v) { setState(() => cardShowTrailing = v); setModalState(() {}); })]),
                        const SizedBox(height: 12),
                        Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                      ]),
                    )
                  ]),
                );
            }

            return SafeArea(child: content);
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    final title = widget.title;

    switch (title) {
      case 'Text':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Default Text', style: TextStyle(fontSize: textSize, fontWeight: textBold ? FontWeight.bold : FontWeight.normal, fontStyle: textItalic ? FontStyle.italic : FontStyle.normal, color: textColor)),
              const SizedBox(height: 8),
              Text('Selectable text example — long press to copy.', style: TextStyle(fontSize: textSize, color: textColor)),
            ],
          ),
        );
        break;

      case 'Image':
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: imageUseNetwork
                    ? Image.network(
                        'https://picsum.photos/400/300',
                        fit: imageFit,
                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('Network image failed')),
                      )
                    : Image.asset(
                        'assets/images/shinchan.png',
                        fit: imageFit,
                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('Asset not found. Add assets/images/shinchan.png and register in pubspec.yaml')),
                      ),
              ),
              const SizedBox(height: 12),
              Text(imageUseNetwork ? 'Image.network from picsum.photos' : 'Image.asset (assets/images/shinchan.png)'),
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
            children: [
              Icon(Icons.favorite, color: iconColor, size: iconSize),
              Icon(Icons.star, color: iconColor, size: iconSize),
              Icon(Icons.settings, color: iconColor, size: iconSize),
              Icon(Icons.phone, color: iconColor, size: iconSize),
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
                elevation: cardElevation,
                color: cardColor,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('Card title'),
                  subtitle: const Text('This is a subtitle of the card.'),
                  trailing: cardShowTrailing ? IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}) : null,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                color: cardColor.withOpacity(0.6),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [const Icon(Icons.info), const SizedBox(width: 12), const Expanded(child: Text('Informational card with an icon.'))],
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(title,style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline, color: Colors.white), onPressed: _showInfo),
          IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: _openSettings),
        ],
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
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(padding: const EdgeInsets.all(12.0), child: body),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
