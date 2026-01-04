import 'package:flutter/material.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  static final List<Map<String, dynamic>> _products = List.generate(8, (i) => {
        'name': 'Product ${i + 1}',
        'price': (19.99 + i * 5).toStringAsFixed(2),
        'image': 'https://picsum.photos/seed/product${i + 1}/400/300',
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[700],
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromARGB(255,154,207,250), Color(0xFF42A5F5)]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 92, 12, 12),
          child: LayoutBuilder(builder: (context, constraints) {
            final crossAxis = (constraints.maxWidth ~/ 220).clamp(2, 4);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxis,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final p = _products[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(p['image'], fit: BoxFit.cover, loadingBuilder: (ctx, child, progress) => progress == null ? child : const Center(child: CircularProgressIndicator())),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(p['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 6),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('\$${p['price']}', style: const TextStyle(color: Colors.green)), IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {} )]),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add to cart (UI only)'))), 
                              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 2, 65, 99)),
                              child: const Text('Add to Cart', style: TextStyle(color: Colors.white),)),
                          ),
                        ]),
                      )
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
