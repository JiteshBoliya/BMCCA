import 'package:flutter/material.dart';

class ButtonsShowcase extends StatefulWidget {
  const ButtonsShowcase({super.key});

  @override
  State<ButtonsShowcase> createState() => _ButtonsShowcaseState();
}

class _ButtonsShowcaseState extends State<ButtonsShowcase> {
  int _counter = 0;
  List<bool> _toggleSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(spacing: 12, runSpacing: 12, alignment: WrapAlignment.center, children: [
            ElevatedButton.icon(onPressed: () => setState(() => _counter++), icon: const Icon(Icons.add), label: const Text('Elevated')),
            TextButton(onPressed: () => setState(() => _counter++), child: const Text('Text Button')),
            OutlinedButton(onPressed: () => setState(() => _counter++), child: const Text('Outlined')),
            IconButton(onPressed: () => setState(() => _counter++), icon: const Icon(Icons.thumb_up)),
          ]),
          const SizedBox(height: 16),
          ToggleButtons(
            isSelected: _toggleSelected,
            onPressed: (i) => setState(() => _toggleSelected[i] = !_toggleSelected[i]),
            children: const [Icon(Icons.format_bold), Icon(Icons.format_italic), Icon(Icons.format_underlined)],
          ),
          const SizedBox(height: 16),
          Text('Pressed $_counter times'),
        ],
      ),
    );
  }
}
