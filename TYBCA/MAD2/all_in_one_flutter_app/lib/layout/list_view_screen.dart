import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  bool horizontal = false;
  int itemCount = 20;
  double itemSpacing = 6;
  double listPadding = 12;
  Color itemColor = Colors.blue.shade100;

  void _openSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(builder: (context, setModalState) {
            return SizedBox(
              height: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(title: Text('ListView Settings')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Orientation'),
                            Switch(value: horizontal, onChanged: (v) { setState(() => horizontal = v); setModalState(() {}); }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Item count'),
                            Text(itemCount.toString()),
                          ],
                        ),
                        Slider(min: 1, max: 50, value: itemCount.toDouble(), onChanged: (v) { setState(() => itemCount = v.toInt()); setModalState(() {}); }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Spacing'),
                            Text(itemSpacing.toStringAsFixed(0)),
                          ],
                        ),
                        Slider(min: 0, max: 40, value: itemSpacing, onChanged: (v) { setState(() => itemSpacing = v); setModalState(() {}); }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Padding'),
                            Text(listPadding.toStringAsFixed(0)),
                          ],
                        ),
                        Slider(min: 0, max: 40, value: listPadding, onChanged: (v) { setState(() => listPadding = v); setModalState(() {}); }),
                        const SizedBox(height: 8),
                        Row(children: [
                          const Text('Item color:'),
                          const SizedBox(width: 8),
                          _colorOption(Colors.blue.shade100, () { setState(() => itemColor = Colors.blue.shade100); setModalState(() {}); }),
                          _colorOption(Colors.green.shade100, () { setState(() => itemColor = Colors.green.shade100); setModalState(() {}); }),
                          _colorOption(Colors.orange.shade100, () { setState(() => itemColor = Colors.orange.shade100); setModalState(() {}); }),
                        ]),
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
        title: const Text('ListView Layout'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('A scrollable list of widgets, optimized for large datasets.'),
              SizedBox(height: 8),
              Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('• scrollDirection — vertical or horizontal scrolling'),
              Text('• itemCount / builder — number of children and lazy building'),
              Text('• padding — space around the list content'),
              Text('• spacing — gap between items (use margin or separators)'),
              Text('• physics / shrinkWrap — scrolling behavior and sizing'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }

  Widget _colorOption(Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(margin: const EdgeInsets.symmetric(horizontal: 6), width: 28, height: 20, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('ListView Example', style: TextStyle(color: Colors.white)),
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
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListView.builder(
                scrollDirection: horizontal ? Axis.horizontal : Axis.vertical,
                padding: EdgeInsets.all(listPadding),
                itemCount: itemCount,
                itemBuilder: (context, i) {
                  return Card(
                    margin: horizontal ? EdgeInsets.symmetric(horizontal: itemSpacing) : EdgeInsets.symmetric(vertical: itemSpacing),
                    color: itemColor,
                    child: SizedBox(
                      width: horizontal ? 160 : double.infinity,
                      child: ListTile(title: Text('Item #${i + 1}')),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
