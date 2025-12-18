import 'package:flutter/material.dart';

class InputWidgetScreen extends StatefulWidget {
  final String title;
  const InputWidgetScreen({super.key, required this.title});

  @override
  State<InputWidgetScreen> createState() => _InputWidgetScreenState();
}

class _InputWidgetScreenState extends State<InputWidgetScreen> {
  bool _checked = false;
  bool _switched = false;
  double _sliderValue = 0.5;
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (widget.title) {
      case 'TextField':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Enter text')),
        );
        break;
      case 'Checkbox':
        body = Center(
          child: CheckboxListTile(
            title: const Text('Enable option'),
            value: _checked,
            onChanged: (v) => setState(() => _checked = v ?? false),
          ),
        );
        break;
      case 'Switch':
        body = Center(
          child: SwitchListTile(
            title: const Text('Toggle'),
            value: _switched,
            onChanged: (v) => setState(() => _switched = v),
          ),
        );
        break;
      case 'Slider':
        body = Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(value: _sliderValue, onChanged: (v) => setState(() => _sliderValue = v)),
                Text('Value: ${_sliderValue.toStringAsFixed(2)}'),
              ],
            ),
          ),
        );
        break;
      case 'Button':
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _counter++),
                child: const Text('Press me'),
              ),
              const SizedBox(height: 12),
              Text('Pressed $_counter times'),
            ],
          ),
        );
        break;
      default:
        body = Center(child: Text('Demo: ${widget.title}'));
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: body,
    );
  }
}
