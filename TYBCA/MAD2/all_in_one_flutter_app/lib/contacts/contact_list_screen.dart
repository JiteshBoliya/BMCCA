import 'package:flutter/material.dart';
import 'contact.dart';
import 'contact_detail_screen.dart';
import 'recent_calls_screen.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  static const List<Contact> _contacts = [
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Alice Johnson', mobile: '+1 555 0100', email: 'alice@example.com'),
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Bob Smith', mobile: '+1 555 0101', email: 'bob@example.com'),
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Carmen Diaz', mobile: '+1 555 0102', email: 'carmen@example.com'),
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Daniel Lee', mobile: '+1 555 0103', email: 'daniel@example.com'),
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Elena Gilbert', mobile: '+1 555 0104', email: 'elena@example.com'),
    Contact(imageAsset: 'assets/images/shinchan.png', name: 'Frank Wu', mobile: '+1 555 0105', email: 'frank@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        actions: [IconButton(icon: const Icon(Icons.history, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecentCallsScreen())) )],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final c = _contacts[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(c.imageAsset)),
              title: Text(c.name),
              subtitle: Text(c.mobile),
              trailing: IconButton(icon: const Icon(Icons.chevron_right), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContactDetailScreen(contact: c)))),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContactDetailScreen(contact: c))),
            ),
          );
        },
      ),
    );
  }
}
