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
              onTap: () {
                // Navigate to different page depending on the index (or name)
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

// Destination pages -------------------------------------------------------
class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Example')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(16)),
          child: const Center(child: Text('Container', style: TextStyle(color: Colors.white, fontSize: 18))),
        ),
      ),
    );
  }
}

class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column Example')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Icon(Icons.star), Icon(Icons.favorite), Icon(Icons.thumb_up)],
            ),
            const SizedBox(height: 24),
            const Text('A Column with a Row above', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Example')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 220, height: 220, color: Colors.purple.shade100),
            Container(width: 160, height: 160, color: Colors.purple.shade300),
            const Text('Stack', style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Example')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 20,
        itemBuilder: (context, i) => Card(margin: const EdgeInsets.symmetric(vertical: 6), child: ListTile(title: Text('Item #${i + 1}'))),
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Example')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(12),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(12, (i) => Container(color: Colors.green.shade200, child: Center(child: Text('${i + 1}')))),
      ),
    );
  }
}