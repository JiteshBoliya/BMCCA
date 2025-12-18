import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutGalleryApp());
}

class LayoutGalleryApp extends StatelessWidget {
  const LayoutGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const LayoutGridScreen(),
    );
  }
}

class LayoutGridScreen extends StatelessWidget {
  const LayoutGridScreen({super.key});

  // List of layout types to display
  final List<Map<String, dynamic>> layouts = const [
    {'name': 'Container', 'icon': Icons.square, 'color': Colors.blue},
    {'name': 'Row & Column', 'icon': Icons.view_quilt, 'color': Colors.blue},
    {'name': 'Stack', 'icon': Icons.layers, 'color': Colors.purple},
    {'name': 'ListView', 'icon': Icons.view_list, 'color': Colors.red},
    {'name': 'GridView', 'icon': Icons.grid_on, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          // Define the grid structure
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1, // Adjusts height/width ratio
          ),
          itemCount: layouts.length,
          itemBuilder: (context, index) {
            final layout = layouts[index];
            return LayoutCard(
              name: layout['name'],
              icon: layout['icon'],
              color: layout['color'],
            );
          },
        ),
      ),
    );
  }
}

class LayoutCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const LayoutCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Exploring $name...')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
            ),
          ],
        ),
      ),
    );
  }
}