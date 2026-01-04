import 'package:flutter/material.dart';
import 'contact.dart';

class RecentCallsScreen extends StatelessWidget {
  const RecentCallsScreen({super.key});

  static final List<Map<String, dynamic>> _recent = [
    {'name': 'Alice Johnson', 'time': 'Today, 09:12', 'type': 'incoming'},
    {'name': 'Bob Smith', 'time': 'Yesterday, 18:45', 'type': 'missed'},
    {'name': 'Carmen Diaz', 'time': 'Yesterday, 14:02', 'type': 'outgoing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recent Calls', style: TextStyle(color: Colors.white)), backgroundColor: Colors.lightBlue[700]),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _recent.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final r = _recent[index];
          Icon leading;
          if (r['type'] == 'missed') {
            leading = const Icon(Icons.call_missed, color: Colors.red);
          } else if (r['type'] == 'outgoing') {
            leading = const Icon(Icons.call_made, color: Colors.green);
          } else {
            leading = const Icon(Icons.call_received, color: Colors.blue);
          }

          return ListTile(
            leading: CircleAvatar(backgroundImage: const AssetImage('assets/images/shinchan.png')),
            title: Text(r['name']),
            subtitle: Text(r['time']),
            trailing: leading,
          );
        },
      ),
    );
  }
}
