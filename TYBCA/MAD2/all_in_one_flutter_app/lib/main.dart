import 'package:flutter/material.dart';
import 'layout/container_screen.dart';
import 'layout/list_view_screen.dart';
import 'layout/row_column_screen.dart';
import 'layout/stack_screen.dart';
import 'layout/grid_view_screen.dart';
import 'layout/display_widget_screen.dart';
import 'layout/input_widget_screen.dart';

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

  // Display widgets group
  final List<Map<String, dynamic>> displayWidgets = const [
    {'name': 'Text', 'icon': Icons.text_fields, 'color': Colors.teal},
    {'name': 'Image', 'icon': Icons.image, 'color': Colors.orange},
    {'name': 'Icon', 'icon': Icons.emoji_emotions, 'color': Colors.pink},
    {'name': 'Card', 'icon': Icons.credit_card, 'color': Colors.brown},
  ];

  // Input widgets group
  final List<Map<String, dynamic>> inputWidgets = const [
    {'name': 'TextField', 'icon': Icons.input, 'color': Colors.indigo},
    {'name': 'Checkbox', 'icon': Icons.check_box, 'color': Colors.teal},
    {'name': 'Switch', 'icon': Icons.toggle_on, 'color': Colors.orange},
    {'name': 'Slider', 'icon': Icons.tune, 'color': Colors.purple},
    {'name': 'Button', 'icon': Icons.touch_app, 'color': Colors.blueGrey},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          // Section 1: Layouts
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Layouts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: layouts.length,
            itemBuilder: (context, index) {
              final layout = layouts[index];
              return LayoutCard(
                name: layout['name'],
                icon: layout['icon'],
                color: layout['color'],
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ContainerScreen()));
                      break;
                    case 1:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const RowColumnScreen()));
                      break;
                    case 2:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const StackScreen()));
                      break;
                    case 3:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ListViewScreen()));
                      break;
                    case 4:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const GridViewScreen()));
                      break;
                    default:
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unknown: ${layout['name']}')));
                  }
                },
              );
            },
          ),

          const SizedBox(height: 20),

          // Section 2: Display widgets
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Display Widgets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: displayWidgets.length,
            itemBuilder: (context, index) {
              final item = displayWidgets[index];
              return LayoutCard(
                name: item['name'],
                icon: item['icon'],
                color: item['color'],
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DisplayWidgetScreen(title: item['name']))),
              );
            },
          ),

          const SizedBox(height: 20),

          // Section 3: Input widgets
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Input Widgets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: inputWidgets.length,
            itemBuilder: (context, index) {
              final item = inputWidgets[index];
              return LayoutCard(
                name: item['name'],
                icon: item['icon'],
                color: item['color'],
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InputWidgetScreen(title: item['name']))),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LayoutCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const LayoutCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap ?? () {
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
