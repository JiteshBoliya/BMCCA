import 'package:flutter/material.dart';
import 'contact.dart';
import 'dial_view.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;
  const ContactDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.lightBlue[700]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: CircleAvatar(radius: 56, backgroundImage: AssetImage(contact.imageAsset))),
          const SizedBox(height: 12),
          Center(child: Text(contact.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 8),
          ListTile(leading: const Icon(Icons.phone), title: Text(contact.mobile), trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DialView(number: contact.mobile, name: contact.name))), child: const Text('Call'))),
          ListTile(leading: const Icon(Icons.email), title: Text(contact.email)),
          const SizedBox(height: 12),
          const Text('More Information', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          const Text('This is a static contact detail screen used for demo purposes. No backend integration.'),
        ]),
      ),
    );
  }
}
