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
  List<bool> _toggleSelected = [false, false, false];
  String? _dropdownValue;
  RangeValues _rangeValues = const RangeValues(20, 80);
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
      case 'Password':
        bool _obscure = true;
        body = StatefulBuilder(
          builder: (context, setLocalState) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              obscureText: _obscure,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setLocalState(() => _obscure = !_obscure),
                ),
              ),
            ),
          ),
        );
        break;
      case 'Multiline':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Multiline'), maxLines: 6),
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
      case 'RangeSlider':
        body = Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RangeSlider(
                  values: _rangeValues,
                  min: 0,
                  max: 100,
                  onChanged: (v) => setState(() => _rangeValues = v),
                ),
                Text('Range: ${_rangeValues.start.toStringAsFixed(0)} - ${_rangeValues.end.toStringAsFixed(0)}'),
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
      case 'ElevatedButton':
        body = Center(
          child: ElevatedButton.icon(onPressed: () => setState(() => _counter++), icon: const Icon(Icons.add), label: const Text('Elevated')),
        );
        break;
      case 'TextButton':
        body = Center(child: TextButton(onPressed: () => setState(() => _counter++), child: const Text('Text Button')));
        break;
      case 'OutlinedButton':
        body = Center(child: OutlinedButton(onPressed: () => setState(() => _counter++), child: const Text('Outlined')));
        break;
      case 'IconButton':
        body = Center(child: IconButton(onPressed: () => setState(() => _counter++), icon: const Icon(Icons.thumb_up)));
        break;
      case 'ToggleButtons':
        body = Center(
          child: ToggleButtons(
            isSelected: _toggleSelected,
            onPressed: (i) => setState(() => _toggleSelected[i] = !_toggleSelected[i]),
            children: const [Icon(Icons.format_bold), Icon(Icons.format_italic), Icon(Icons.format_underlined)],
          ),
        );
        break;
      default:
        body = Center(child: Text('Demo: ${widget.title}'));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color: Colors.white)),
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
