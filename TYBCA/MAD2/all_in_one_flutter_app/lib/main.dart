import 'problems/collegeAdmissionForm.dart';
import 'package:flutter/material.dart';
import 'layout/container_screen.dart';
import 'layout/list_view_screen.dart';
import 'layout/row_column_screen.dart';
import 'layout/stack_screen.dart';
import 'layout/grid_view_screen.dart';
import 'display/display_widget_screen.dart';
import 'inputs/input_widget_screen.dart';
import 'problems/product_listing.dart';
import 'problems/travel_detail.dart';
import 'contacts/contact_list_screen.dart';
import 'gallery/gallery_screen.dart';
import 'widgets/app_footer.dart';

void main() {
  runApp(const LayoutGalleryApp());
}

class LayoutGalleryApp extends StatefulWidget {
  const LayoutGalleryApp({super.key});

  @override
  State<LayoutGalleryApp> createState() => _LayoutGalleryAppState();
}

class _LayoutGalleryAppState extends State<LayoutGalleryApp> {
  Color _seedColor = Colors.blue;

  void _updateTheme(Color c) => setState(() => _seedColor = c);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
        useMaterial3: true,
        fontFamily: 'Pacifico',
      ),
      home: LayoutGridScreen(onThemeChanged: _updateTheme),
    );
  }
}

class LayoutGridScreen extends StatelessWidget {
  final ValueChanged<Color>? onThemeChanged;
  const LayoutGridScreen({super.key, this.onThemeChanged});

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
    {'name': 'Password', 'icon': Icons.lock, 'color': Colors.indigo},
    {'name': 'Multiline', 'icon': Icons.notes, 'color': Colors.indigo},
    {'name': 'Checkbox', 'icon': Icons.check_box, 'color': Colors.teal},
    {'name': 'Switch', 'icon': Icons.toggle_on, 'color': Colors.orange},
    {'name': 'Slider', 'icon': Icons.tune, 'color': Colors.purple},
    {'name': 'RangeSlider', 'icon': Icons.linear_scale, 'color': Colors.purple},
    {'name': 'Button', 'icon': Icons.touch_app, 'color': Colors.blueGrey},
  ];

  // Problem sheet section (placeholder items)
  final List<Map<String, dynamic>> problems = const [
    {'name': 'College Admission Form', 'icon': Icons.school, 'color': Colors.indigo},
    {'name': 'Product List', 'icon': Icons.shopping_bag, 'color': Colors.teal},
    {'name': 'Travel Destination Detail', 'icon': Icons.place, 'color': Colors.orange},
    {'name': 'Contact Management', 'icon': Icons.contacts, 'color': Colors.green},
    {'name': 'Gallery Application', 'icon': Icons.photo_library, 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: FlutterLogo(),
        ),
        title: const Text('Flutter', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              final colors = [Colors.blue, Colors.indigo, Colors.teal, Colors.deepOrange, Colors.purple, Colors.green, Colors.pink];
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(spacing: 12, children: colors.map((c) => GestureDetector(onTap: () { Navigator.of(context).pop(); onThemeChanged?.call(c); }, child: CircleAvatar(backgroundColor: c, radius: 22))).toList()),
                ),
              );
            },
          )
        ],
        // centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.lightBlue[700],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 154, 207, 250), Color.fromARGB(255, 0, 107, 194)],
          ),
        ),
        child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // Section 1: Layouts
          SectionCard(
            title: 'Layouts',
            child: LayoutBuilder(builder: (context, constraints) {
              final crossAxis = (constraints.maxWidth ~/ 160).clamp(2, 6);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxis,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
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
              );
            }),
          ),

          const SizedBox(height: 20),
          
          // Section 2: Display widgets
          SectionCard(
            title: 'Display Widgets',
            child: LayoutBuilder(builder: (context, constraints) {
              final crossAxis = (constraints.maxWidth ~/ 160).clamp(2, 6);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxis,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
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
              );
            }),
          ),

          const SizedBox(height: 20),

          // Section 3: Input widgets
          SectionCard(
            title: 'Input Widgets',
            child: LayoutBuilder(builder: (context, constraints) {
              final crossAxis = (constraints.maxWidth ~/ 160).clamp(2, 6);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxis,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
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
              );
            }),
          ),
          const SizedBox(height: 20),

          // Section 4: Problem Sheet 1
          SectionCard(
            title: 'Problem Sheet 1',
            child: LayoutBuilder(builder: (context, constraints) {
              final crossAxis = (constraints.maxWidth ~/ 160).clamp(2, 6);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxis,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: problems.length,
                itemBuilder: (context, index) {
                  final item = problems[index];
                  return LayoutCard(
                    name: item['name'],
                    icon: item['icon'],
                    color: item['color'],
                    onTap: index == 0
                      ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProblemSheet1Screen()))
                      : index == 1
                        ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductListingScreen()))
                        : index == 2
                          ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TravelDetailScreen()))
                          : index == 3
                            ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactListScreen()))
                            : index == 4
                              ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GalleryScreen()))
                              : null,
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 18),
          const Divider(),
          const AppFooter(),
        ],
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
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Exploring $name...')),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, size: 28, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Small reusable section card
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
              child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
