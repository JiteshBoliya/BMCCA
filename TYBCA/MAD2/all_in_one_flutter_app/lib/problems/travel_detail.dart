import 'package:flutter/material.dart';

class TravelDetailScreen extends StatefulWidget {
  const TravelDetailScreen({super.key});

  @override
  State<TravelDetailScreen> createState() => _TravelDetailScreenState();
}

class _TravelDetailScreenState extends State<TravelDetailScreen> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final imageHeight = media.size.height * 0.45;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://picsum.photos/900/600?travel',
                  fit: BoxFit.cover,
                ),
                // dark gradient for legibility
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0.25), Colors.transparent, Colors.black.withOpacity(0.35)],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 24,
                  right: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Santorini, Greece', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text('A beautiful island with blue domes and sunsets', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                        child: Row(children: const [Icon(Icons.star, color: Colors.amber, size: 18), SizedBox(width: 6), Text('4.8', style: TextStyle(color: Colors.white))]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: media.padding.top + 8,
                  left: 8,
                  child: IconButton(
                    icon: const CircleAvatar(backgroundColor: Colors.white70, child: Icon(Icons.arrow_back, color: Colors.black)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  top: media.padding.top + 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => _favorite = !_favorite),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 6)]),
                      child: Icon(_favorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(children: const [Icon(Icons.location_on, color: Colors.blueGrey), SizedBox(width: 6), Text('Greece')])
                  ]),
                  const SizedBox(height: 12),
                  const Text(
                    'Santorini is known for its dramatic views, stunning sunsets, and white-washed houses. Stroll through narrow streets, enjoy fresh seafood, and relax on volcanic beaches. Perfect for romantic getaways and photography enthusiasts.',
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 14),
                  Wrap(spacing: 8, runSpacing: 8, children: const [
                    Chip(label: Text('Beaches')),
                    Chip(label: Text('Sightseeing')),
                    Chip(label: Text('Photography')),
                    Chip(label: Text('Romantic')),
                  ]),
                  const SizedBox(height: 20),
                  const Text('Activities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    ListTile(leading: Icon(Icons.directions_boat), title: Text('Boat tour'), subtitle: Text('Sunset cruise around the caldera')),
                    ListTile(leading: Icon(Icons.restaurant), title: Text('Local Cuisine'), subtitle: Text('Tavernas and seafood specialities')),
                    ListTile(leading: Icon(Icons.camera_alt), title: Text('Photo spots'), subtitle: Text('Iconic blue-domed churches')),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(child: ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Book Now (UI only)'))), child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Book Now')))),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 56,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => setState(() => _favorite = !_favorite),
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: Icon(_favorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                      ),
                    )
                  ])
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
