import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  double backSize = 220;
  double midSize = 160;
  Alignment stackAlignment = Alignment.center;
  String alignmentName = 'Center';
  Color backColor = Colors.purple.shade100;
  Color midColor = Colors.purple.shade300;
  bool showLabel = true;

  void _openSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(builder: (context, setModalState) {
            return SizedBox(
              height: 420,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(title: Text('Stack Settings')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Alignment'),
                            DropdownButton<String>(
                              value: alignmentName,
                              items: <String>['Top Left','Top Center','Top Right','Center Left','Center','Center Right','Bottom Left','Bottom Center','Bottom Right']
                                  .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) {
                                if (v == null) return;
                                setState(() {
                                  alignmentName = v;
                                  stackAlignment = _alignmentFromName(v);
                                });
                                setModalState(() {});
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Back box size'),
                            Text(backSize.toStringAsFixed(0)),
                          ],
                        ),
                        Slider(min: 80, max: 360, value: backSize, onChanged: (v) { setState(() => backSize = v); setModalState(() {}); }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Middle box size'),
                            Text(midSize.toStringAsFixed(0)),
                          ],
                        ),
                        Slider(min: 60, max: 320, value: midSize, onChanged: (v) { setState(() => midSize = v); setModalState(() {}); }),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Back color:'),
                            const SizedBox(width: 8),
                            _colorOption(Colors.purple.shade100, () { setState(() => backColor = Colors.purple.shade100); setModalState(() {}); }),
                            _colorOption(Colors.blue.shade100, () { setState(() => backColor = Colors.blue.shade100); setModalState(() {}); }),
                            _colorOption(Colors.green.shade100, () { setState(() => backColor = Colors.green.shade100); setModalState(() {}); }),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Mid color:'),
                            const SizedBox(width: 8),
                            _colorOption(Colors.purple.shade300, () { setState(() => midColor = Colors.purple.shade300); setModalState(() {}); }),
                            _colorOption(Colors.blue.shade300, () { setState(() => midColor = Colors.blue.shade300); setModalState(() {}); }),
                            _colorOption(Colors.orange.shade300, () { setState(() => midColor = Colors.orange.shade300); setModalState(() {}); }),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Show label'),
                            Switch(value: showLabel, onChanged: (v) { setState(() => showLabel = v); setModalState(() {}); }),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stack Layout'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('A Stack places its children on top of each other. Useful for overlays and absolute positioning.'),
              SizedBox(height: 8),
              Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('• alignment — how non-positioned children are aligned within the stack'),
              Text('• fit — how children are sized to the stack (StackFit)'),
              Text('• clipBehavior — whether overflow is clipped'),
              Text('• children order — later children are painted on top'),
              Text('• Positioned — use Positioned widget for absolute placement'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }

  Alignment _alignmentFromName(String name) {
    switch (name) {
      case 'Top Left': return Alignment.topLeft;
      case 'Top Center': return Alignment.topCenter;
      case 'Top Right': return Alignment.topRight;
      case 'Center Left': return Alignment.centerLeft;
      case 'Center Right': return Alignment.centerRight;
      case 'Bottom Left': return Alignment.bottomLeft;
      case 'Bottom Center': return Alignment.bottomCenter;
      case 'Bottom Right': return Alignment.bottomRight;
      case 'Center':
      default: return Alignment.center;
    }
  }

  Widget _colorOption(Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 36,
        height: 24,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Stack Example',style: TextStyle(color: Colors.white)),
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
            child: Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    alignment: stackAlignment,
                    children: [
                      Container(width: backSize, height: backSize, color: backColor),
                      Container(width: midSize, height: midSize, color: midColor),
                      if (showLabel) const Text('Stack', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
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
