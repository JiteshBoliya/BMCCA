import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  double boxWidth = 220;
  double boxHeight = 220;
  double borderRadius = 16;
  Color boxColor = Colors.blueAccent;

  void _openSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return SizedBox(
                height: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(title: Text('Container Settings')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Width'),
                              Text(boxWidth.toStringAsFixed(0)),
                            ],
                          ),
                          Slider(
                            min: 100,
                            max: 320,
                            value: boxWidth,
                            onChanged: (v) {
                              setState(() => boxWidth = v);
                              setModalState(() {});
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Height'),
                              Text(boxHeight.toStringAsFixed(0)),
                            ],
                          ),
                          Slider(
                            min: 100,
                            max: 320,
                            value: boxHeight,
                            onChanged: (v) {
                              setState(() => boxHeight = v);
                              setModalState(() {});
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Border Radius'),
                              Text(borderRadius.toStringAsFixed(0)),
                            ],
                          ),
                          Slider(
                            min: 0,
                            max: 64,
                            value: borderRadius,
                            onChanged: (v) {
                              setState(() => borderRadius = v);
                              setModalState(() {});
                            },
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('Color:'),
                              const SizedBox(width: 8),
                              _colorOption(Colors.blueAccent, setModalState),
                              _colorOption(Colors.teal, setModalState),
                              _colorOption(Colors.orangeAccent, setModalState),
                              _colorOption(Colors.purpleAccent, setModalState),
                              _colorOption(Colors.redAccent, setModalState),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Container Layout'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('A flexible box that can be sized, decorated and positioned. Useful for styling a single child.'),
              SizedBox(height: 8),
              Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('• width / height — set fixed size'),
              Text('• color / decoration — background styling'),
              Text('• borderRadius — rounded corners via BoxDecoration'),
              Text('• alignment — position child (with Align or parent)'),
              Text('• margin / padding — spacing outside/inside the box'),
              Text('• child — the widget contained inside the Container'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }

  Widget _colorOption(Color color, void Function(void Function()) setModalState) {
    return GestureDetector(
      onTap: () {
        setState(() => boxColor = color);
        setModalState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: boxColor == color ? Border.all(color: Colors.black, width: 2) : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Container Example', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline, color: Colors.white), onPressed: _showInfo),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: _openSettings,
          ),
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
            child: Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: boxWidth,
                    height: boxHeight,
                    decoration: BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(borderRadius)),
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
