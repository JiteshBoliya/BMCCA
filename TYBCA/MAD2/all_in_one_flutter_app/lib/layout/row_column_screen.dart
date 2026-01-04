import 'package:flutter/material.dart';

class RowColumnScreen extends StatefulWidget {
  const RowColumnScreen({super.key});

  @override
  State<RowColumnScreen> createState() => _RowColumnScreenState();
}

class _RowColumnScreenState extends State<RowColumnScreen> {
  // Row settings
  MainAxisAlignment rowMain = MainAxisAlignment.spaceAround;
  CrossAxisAlignment rowCross = CrossAxisAlignment.center;
  double rowSpacing = 8;

  // Column settings
  MainAxisAlignment colMain = MainAxisAlignment.start;
  CrossAxisAlignment colCross = CrossAxisAlignment.center;
  double colSpacing = 16;

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
                  const ListTile(title: Text('Row & Column Settings')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(children: [
                      const SizedBox(height: 8),
                      const Text('Row Settings', style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Main Axis'),
                          DropdownButton<MainAxisAlignment>(
                            value: rowMain,
                            items: [
                              MainAxisAlignment.start,
                              MainAxisAlignment.center,
                              MainAxisAlignment.end,
                              MainAxisAlignment.spaceBetween,
                              MainAxisAlignment.spaceAround,
                              MainAxisAlignment.spaceEvenly,
                            ].map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
                            onChanged: (v) {
                              if (v == null) return;
                              setState(() => rowMain = v);
                              setModalState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cross Axis'),
                          DropdownButton<CrossAxisAlignment>(
                            value: rowCross,
                            items: [
                              CrossAxisAlignment.start,
                              CrossAxisAlignment.center,
                              CrossAxisAlignment.end,
                              CrossAxisAlignment.stretch,
                              CrossAxisAlignment.baseline,
                            ].map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
                            onChanged: (v) {
                              if (v == null) return;
                              setState(() => rowCross = v);
                              setModalState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Icon Spacing'),
                          Text(rowSpacing.toStringAsFixed(0)),
                        ],
                      ),
                      Slider(min: 0, max: 40, value: rowSpacing, onChanged: (v) {
                        setState(() => rowSpacing = v);
                        setModalState(() {});
                      }),
                      const Divider(),
                      const SizedBox(height: 8),
                      const Text('Column Settings', style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Main Axis'),
                          DropdownButton<MainAxisAlignment>(
                            value: colMain,
                            items: [
                              MainAxisAlignment.start,
                              MainAxisAlignment.center,
                              MainAxisAlignment.end,
                              MainAxisAlignment.spaceBetween,
                              MainAxisAlignment.spaceAround,
                              MainAxisAlignment.spaceEvenly,
                            ].map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
                            onChanged: (v) {
                              if (v == null) return;
                              setState(() => colMain = v);
                              setModalState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cross Axis'),
                          DropdownButton<CrossAxisAlignment>(
                            value: colCross,
                            items: [
                              CrossAxisAlignment.start,
                              CrossAxisAlignment.center,
                              CrossAxisAlignment.end,
                              CrossAxisAlignment.stretch,
                              CrossAxisAlignment.baseline,
                            ].map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
                            onChanged: (v) {
                              if (v == null) return;
                              setState(() => colCross = v);
                              setModalState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Spacing'),
                          Text(colSpacing.toStringAsFixed(0)),
                        ],
                      ),
                      Slider(min: 0, max: 80, value: colSpacing, onChanged: (v) {
                        setState(() => colSpacing = v);
                        setModalState(() {});
                      }),
                      const SizedBox(height: 12),
                      Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ]),
                  )
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
        title: const Text('Row & Column Layout'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Layouts for arranging children in a single horizontal (`Row`) or vertical (`Column`) line.'),
              SizedBox(height: 8),
              Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('• mainAxisAlignment — how children are placed along the main axis'),
              Text('• crossAxisAlignment — how children are placed along the cross axis'),
              Text('• mainAxisSize — whether to use min or max on main axis'),
              Text('• children — ordered list of widgets displayed'),
              Text('• spacing — gap between children (use SizedBox or custom padding)'),
              Text('• textDirection / verticalDirection — control directionality'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Row & Column Example', style: TextStyle(color: Colors.white)),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: colMain,
                    crossAxisAlignment: colCross,
                    children: [
                      Row(
                        mainAxisAlignment: rowMain,
                        crossAxisAlignment: rowCross,
                        children: [
                          const Icon(Icons.star),
                          SizedBox(width: rowSpacing),
                          const Icon(Icons.favorite),
                          SizedBox(width: rowSpacing),
                          const Icon(Icons.thumb_up),
                        ],
                      ),
                      SizedBox(height: colSpacing),
                      const Text('A Column with a Row above', style: TextStyle(fontSize: 16)),
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
