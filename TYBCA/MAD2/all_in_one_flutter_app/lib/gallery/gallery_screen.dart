import 'package:flutter/material.dart';
import 'image_model.dart';
import 'image_preview.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool _gridMode = true;

  final List<ImageItem> _images = const [
    ImageItem(name: 'img 1', source: '../assets/gallery/img1.jpeg', modifiedDate: '2025-12-01', size: '120 KB', type: 'JPEG'),
    ImageItem(name: 'img 2', source: '../assets/gallery/img2.jpeg', modifiedDate: '2025-11-20', size: '110 KB', type: 'JPEG'),
    ImageItem(name: 'img 3', source: '../assets/gallery/img3.jpg', modifiedDate: '2025-10-15', size: '130 KB', type: 'JPG'),
    ImageItem(name: 'img 4', source: '../assets/gallery/img4.jpg', modifiedDate: '2025-09-09', size: '98 KB', type: 'JPG'),
    ImageItem(name: 'img 5', source: '../assets/gallery/img5.jpg', modifiedDate: '2025-08-21', size: '145 KB', type: 'JPG'),
    ImageItem(name: 'img 6', source: '../assets/gallery/img6.jpg', modifiedDate: '2025-07-30', size: '101 KB', type: 'JPG'),
    ImageItem(name: 'img 7', source: '../assets/gallery/img7.jpg', modifiedDate: '2025-06-15', size: '115 KB', type: 'JPG'),
    ImageItem(name: 'img 8', source: '../assets/gallery/img8.png', modifiedDate: '2025-06-15', size: '115 KB', type: 'PNG'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        actions: [
          IconButton(icon: Icon(_gridMode ? Icons.view_list : Icons.grid_view, color: Colors.white), onPressed: () => setState(() => _gridMode = !_gridMode)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _gridMode ? _buildGrid(context) : _buildList(context),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cross = (constraints.maxWidth ~/ 160).clamp(2, 6);
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cross, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          final item = _images[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ImagePreviewScreen(item: item))),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(10)), child: Image.asset(item.source, fit: BoxFit.cover, width: double.infinity))),
                Padding(padding: const EdgeInsets.all(8.0), child: Text(item.name, style: const TextStyle(fontSize: 14))),
              ]),
            ),
          );
        },
      );
    });
  }

  Widget _buildList(BuildContext context) {
    return ListView.separated(
      itemCount: _images.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = _images[index];
        return ListTile(
          leading: SizedBox(width: 64, height: 64, child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(item.source, fit: BoxFit.cover))),
          title: Text(item.name),
          subtitle: Text('${item.modifiedDate} • ${item.size} • ${item.type}'),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ImagePreviewScreen(item: item))),
        );
      },
    );
  }
}
