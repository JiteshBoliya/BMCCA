import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  int crossAxisCount = 3;
  double spacing = 8;
  double paddingVal = 12;
  double childAspect = 1;
  int itemCount = 12;
  Color itemColor = Colors.green.shade200;

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
                  const ListTile(title: Text('GridView Settings')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Columns'),
                          Text(crossAxisCount.toString()),
                        ],
                      ),
                      Slider(min: 1, max: 6, divisions: 5, value: crossAxisCount.toDouble(), onChanged: (v) { setState(() => crossAxisCount = v.toInt()); setModalState(() {}); }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Spacing'),
                          Text(spacing.toStringAsFixed(0)),
                        ],
                      ),
                      Slider(min: 0, max: 40, value: spacing, onChanged: (v) { setState(() => spacing = v); setModalState(() {}); }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Padding'),
                          Text(paddingVal.toStringAsFixed(0)),
                        ],
                      ),
                      Slider(min: 0, max: 40, value: paddingVal, onChanged: (v) { setState(() => paddingVal = v); setModalState(() {}); }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Aspect'),
                          Text(childAspect.toStringAsFixed(2)),
                        ],
                      ),
                      Slider(min: 0.5, max: 2, value: childAspect, onChanged: (v) { setState(() => childAspect = v); setModalState(() {}); }),
                      Row(children: [
                        const Text('Item color:'),
                        const SizedBox(width: 8),
                        _colorOption(Colors.green.shade200, () { setState(() => itemColor = Colors.green.shade200); setModalState(() {}); }),
                        _colorOption(Colors.blue.shade200, () { setState(() => itemColor = Colors.blue.shade200); setModalState(() {}); }),
                        _colorOption(Colors.orange.shade200, () { setState(() => itemColor = Colors.orange.shade200); setModalState(() {}); }),
                      ]),
                      const SizedBox(height: 12),
                      Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ]),
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
        title: const Text('GridView Layout'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('A grid-based layout displaying children in a 2D arrangement.'),
              SizedBox(height: 8),
              Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('• crossAxisCount — number of columns'),
              Text('• mainAxisSpacing / crossAxisSpacing — gaps between grid items'),
              Text('• childAspectRatio — width / height ratio of tiles'),
              Text('• padding — space around the grid content'),
              Text('• itemCount / children — number of tiles to display'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }

  Widget _colorOption(Color color, VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: Container(margin: const EdgeInsets.symmetric(horizontal: 6), width: 28, height: 20, color: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('GridView Example', style: TextStyle(color: Colors.white)),
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
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                padding: EdgeInsets.all(paddingVal),
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: childAspect,
                children: List.generate(itemCount, (i) => Container(color: itemColor, child: Center(child: Text('${i + 1}')))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
