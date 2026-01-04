import 'package:flutter/material.dart';

class ProblemSheet1Screen extends StatefulWidget {
  const ProblemSheet1Screen({super.key});

  @override
  State<ProblemSheet1Screen> createState() => _ProblemSheet1ScreenState();
}

class _ProblemSheet1ScreenState extends State<ProblemSheet1Screen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _dobCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();

  String _gender = 'Male';
  String _course = 'BCA';

  void _reset() {
    setState(() {
      _nameCtrl.clear();
      _emailCtrl.clear();
      _phoneCtrl.clear();
      _dobCtrl.clear();
      _addressCtrl.clear();
      _gender = 'Male';
      _course = 'BCA';
    });
  }

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form submitted (static demo)')));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _dobCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double topOffset = MediaQuery.of(context).padding.top + kToolbarHeight + 12;
    final double availHeight = MediaQuery.of(context).size.height - topOffset - 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('College Admission Form', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromARGB(255,154,207,250), Color(0xFF42A5F5)]),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, topOffset, 12, 12),
          child: SingleChildScrollView(
            child: SizedBox(
              height: availHeight,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text('Please fill the admission form', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),

                    TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
                    const SizedBox(height: 12),

                    TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()), keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 12),

                    Row(children: [
                      Expanded(child: TextField(controller: _phoneCtrl, decoration: const InputDecoration(labelText: 'Phone', border: OutlineInputBorder()), keyboardType: TextInputType.phone)),
                      const SizedBox(width: 12),
                      Expanded(child: TextField(controller: _dobCtrl, decoration: const InputDecoration(labelText: 'Date of Birth', border: OutlineInputBorder()), keyboardType: TextInputType.datetime)),
                    ]),
                    const SizedBox(height: 12),

                    TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()), maxLines: 3),
                    const SizedBox(height: 16),

                    const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600)),
                    Column(children: [
                      RadioListTile<String>(title: const Text('Male'), value: 'Male', groupValue: _gender, onChanged: (v) => setState(() => _gender = v ?? 'Male')),
                      RadioListTile<String>(title: const Text('Female'), value: 'Female', groupValue: _gender, onChanged: (v) => setState(() => _gender = v ?? 'Female')),
                      RadioListTile<String>(title: const Text('Other'), value: 'Other', groupValue: _gender, onChanged: (v) => setState(() => _gender = v ?? 'Other')),
                    ]),
                    const SizedBox(height: 8),

                    const Text('Course Selection', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _course,
                      items: const [
                        DropdownMenuItem(value: 'BSc', child: Text('BSc')),
                        DropdownMenuItem(value: 'BA', child: Text('BA')),
                        DropdownMenuItem(value: 'BCom', child: Text('BCom')),
                        DropdownMenuItem(value: 'BCA', child: Text('BCA')),
                        DropdownMenuItem(value: 'BCS', child: Text('BCS')),
                      ],
                      onChanged: (v) => setState(() => _course = v ?? 'BCA'),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),

                    const SizedBox(height: 20),
                    Row(children: [
                      Expanded(child: ElevatedButton(onPressed: _submit, child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Submit')))),
                      const SizedBox(width: 12),
                      Expanded(child: OutlinedButton(onPressed: _reset, child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Reset')))),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      ),
    );
  }
}
