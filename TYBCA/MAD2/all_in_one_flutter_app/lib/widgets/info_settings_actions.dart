import 'package:flutter/material.dart';

class InfoSettingsActions extends StatelessWidget {
  final VoidCallback onInfo;
  final VoidCallback onSettings;

  const InfoSettingsActions({super.key, required this.onInfo, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, color: Colors.white),
      onSelected: (value) {
        if (value == 'info') onInfo();
        if (value == 'settings') onSettings();
      },
      itemBuilder: (_) => [
        const PopupMenuItem(value: 'info', child: ListTile(leading: Icon(Icons.info_outline), title: Text('Info'))),
        const PopupMenuItem(value: 'settings', child: ListTile(leading: Icon(Icons.settings), title: Text('Settings'))),
      ],
    );
  }
}
