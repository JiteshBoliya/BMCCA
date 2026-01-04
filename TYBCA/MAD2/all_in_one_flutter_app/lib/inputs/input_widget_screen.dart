import 'package:flutter/material.dart';
import '../widgets/buttons_showcase.dart';
// Info/settings are shown directly in the AppBar (icons)

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
  // configurable properties for settings
  String textFieldLabel = 'Enter text';
  String passwordLabel = 'Password';
  String multilineLabel = 'Multiline';
  int multilineMaxLines = 6;
  String checkboxLabel = 'Enable option';
  String switchLabel = 'Toggle';
  double sliderMin = 0.0;
  double sliderMax = 1.0;
  double rangeMin = 0.0;
  double rangeMax = 100.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _showInfo() {
    final title = widget.title;
    showDialog(
      context: context,
      builder: (context) {
        Widget content;
        switch (title) {
          case 'TextField':
          case 'Password':
          case 'Multiline':
            content = SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Text input widgets allow user text entry.'),
                SizedBox(height: 8),
                Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('• controller — manage the input text'),
                Text('• decoration — label, hint, suffix/prefix icons'),
                Text('• obscureText — hide characters for passwords'),
                Text('• maxLines — number of lines (multiline)'),
              ]),
            );
            break;
          case 'Checkbox':
            content = SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Checkbox is a binary selection control.'), SizedBox(height: 8), Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6), Text('• value — true/false'), Text('• onChanged — callback when toggled'),
            ]));
            break;
          case 'Switch':
            content = SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Switch is a thumb-toggle control for on/off values.'), SizedBox(height: 8), Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6), Text('• value — on/off'), Text('• onChanged — handler'),
            ]));
            break;
          case 'Slider':
            content = SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Slider selects a value from a range.'), SizedBox(height: 8), Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6), Text('• min / max — range bounds'), Text('• value / onChanged — current value and handler'),
            ]));
            break;
          case 'RangeSlider':
            content = SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('RangeSlider selects a range of values.'), SizedBox(height: 8), Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6), Text('• values — RangeValues'), Text('• min / max — bounds'),
            ]));
            break;
          case 'Button':
          case 'ElevatedButton':
          case 'TextButton':
          case 'OutlinedButton':
          case 'IconButton':
          case 'ToggleButtons':
            content = SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Buttons trigger actions when pressed.'), SizedBox(height: 8), Text('Properties:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6), Text('• onPressed — callback executed on tap'), Text('• style — color, padding, shape'), Text('• icon / label — content for labeled buttons'),
            ]));
            break;
          default:
            content = const Text('No info available.');
        }

        return AlertDialog(title: Text('$title'), content: content, actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))]);
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
              case 'TextField':
                content = SizedBox(
                  height: 260,
                  child: Column(children: [
                    const ListTile(title: Text('TextField Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      TextField(decoration: const InputDecoration(labelText: 'Label'), onChanged: (v) { setState(() => textFieldLabel = v); setModalState(() {}); }, controller: TextEditingController(text: textFieldLabel)),
                      const SizedBox(height: 12),
                      Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Password':
                content = SizedBox(
                  height: 220,
                  child: Column(children: [
                    const ListTile(title: Text('Password Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      TextField(decoration: const InputDecoration(labelText: 'Label'), onChanged: (v) { setState(() => passwordLabel = v); setModalState(() {}); }, controller: TextEditingController(text: passwordLabel)),
                      const SizedBox(height: 12),
                      Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Multiline':
                content = SizedBox(
                  height: 260,
                  child: Column(children: [
                    const ListTile(title: Text('Multiline Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      TextField(decoration: const InputDecoration(labelText: 'Label'), onChanged: (v) { setState(() => multilineLabel = v); setModalState(() {}); }, controller: TextEditingController(text: multilineLabel)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Max lines'), Text(multilineMaxLines.toString())]),
                      Slider(min: 1, max: 12, value: multilineMaxLines.toDouble(), onChanged: (v) { setState(() => multilineMaxLines = v.toInt()); setModalState(() {}); }),
                      const SizedBox(height: 12), Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Checkbox':
                content = SizedBox(
                  height: 220,
                  child: Column(children: [
                    const ListTile(title: Text('Checkbox Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      TextField(decoration: const InputDecoration(labelText: 'Label'), onChanged: (v) { setState(() => checkboxLabel = v); setModalState(() {}); }, controller: TextEditingController(text: checkboxLabel)),
                      const SizedBox(height: 12), Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Switch':
                content = SizedBox(
                  height: 220,
                  child: Column(children: [
                    const ListTile(title: Text('Switch Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      TextField(decoration: const InputDecoration(labelText: 'Label'), onChanged: (v) { setState(() => switchLabel = v); setModalState(() {}); }, controller: TextEditingController(text: switchLabel)),
                      const SizedBox(height: 12), Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Slider':
                content = SizedBox(
                  height: 260,
                  child: Column(children: [
                    const ListTile(title: Text('Slider Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Min'), Text(sliderMin.toStringAsFixed(1))]),
                      Slider(min: -100, max: 100, value: sliderMin, onChanged: (v) { setState(() => sliderMin = v); setModalState(() {}); }),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Max'), Text(sliderMax.toStringAsFixed(1))]),
                      Slider(min: -100, max: 200, value: sliderMax, onChanged: (v) { setState(() => sliderMax = v); setModalState(() {}); }),
                      const SizedBox(height: 12), Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'RangeSlider':
                content = SizedBox(
                  height: 260,
                  child: Column(children: [
                    const ListTile(title: Text('RangeSlider Settings')),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Min'), Text(rangeMin.toStringAsFixed(0))]),
                      Slider(min: -100, max: 100, value: rangeMin, onChanged: (v) { setState(() => rangeMin = v); setModalState(() {}); }),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Max'), Text(rangeMax.toStringAsFixed(0))]),
                      Slider(min: 0, max: 500, value: rangeMax, onChanged: (v) { setState(() => rangeMax = v); setModalState(() {}); }),
                      const SizedBox(height: 12), Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                    ])),
                  ]),
                );
                break;
              case 'Button':
              case 'ElevatedButton':
              case 'TextButton':
              case 'OutlinedButton':
              case 'IconButton':
              case 'ToggleButtons':
                content = SizedBox(
                  height: 200,
                  child: Column(children: [
                    const ListTile(title: Text('Buttons Settings')),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text('Use the demo to try different button types. There are no global settings for this combined showcase.')),
                    const SizedBox(height: 12),
                    Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))),
                  ]),
                );
                break;
              default:
                content = const SizedBox.shrink();
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
    switch (widget.title) {
      case 'TextField':
        body = Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(controller: _controller, decoration: InputDecoration(labelText: textFieldLabel)),
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
                labelText: passwordLabel,
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
          child: TextField(controller: _controller, decoration: InputDecoration(labelText: multilineLabel), maxLines: multilineMaxLines),
        );
        break;
      case 'Checkbox':
        body = Center(
          child: CheckboxListTile(
            title: Text(checkboxLabel),
            value: _checked,
            onChanged: (v) => setState(() => _checked = v ?? false),
          ),
        );
        break;
      case 'Switch':
        body = Center(
          child: SwitchListTile(
            title: Text(switchLabel),
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
                Slider(value: _sliderValue, min: sliderMin, max: sliderMax, onChanged: (v) => setState(() => _sliderValue = v)),
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
                  min: rangeMin,
                  max: rangeMax,
                  onChanged: (v) => setState(() => _rangeValues = v),
                ),
                Text('Range: ${_rangeValues.start.toStringAsFixed(0)} - ${_rangeValues.end.toStringAsFixed(0)}'),
              ],
            ),
          ),
        );
        break;
      case 'Button':
      case 'ElevatedButton':
      case 'TextButton':
      case 'OutlinedButton':
      case 'IconButton':
      case 'ToggleButtons':
        body = const ButtonsShowcase();
        break;
      default:
        body = Center(child: Text('Demo: ${widget.title}'));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title,style: const TextStyle(color: Colors.white)),
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
