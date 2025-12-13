import 'package:flutter/material.dart'; // Importing Flutter material package for UI components

void main() {
  // runApp is the entry point of the Flutter application
  runApp(const MyApp()); // MyApp is the root widget of the application
}

// MyApp is a stateless widget that sets up the MaterialApp
class MyApp extends StatelessWidget {  // stateless widget does not maintain any state
  const MyApp({super.key});  // super.key passes the key to the parent class

  @override // overriding the build method to define the UI
  Widget build(BuildContext context) {  // build method returns a widget
    return MaterialApp(  // MaterialApp is a convenience widget that wraps several widgets commonly required for material design applications
      title: 'Profile Cards App',
      debugShowCheckedModeBanner: false,  // Hides the debug banner
      home: const HomeScreen(),  // HomeScreen is the main screen of the app
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String imagePath; // final variable to hold the image path. It cannot be changed after initialization.
  final String name;
  final String dob;
  final double height;
  final double width;

  const ProfileCard({
    super.key,  
    required this.imagePath, // required named parameters
    required this.name,
    required this.dob,
    this.height = 320.0,
    this.width = 250.0,
  });

  @override
  Widget build(BuildContext context) { // buildContext method to describe the part of the user interface represented by this widget

    return Card( // Card widget to create a material design card
      elevation: 10,
      margin: const EdgeInsets.all(16),  // EdgeInsets to provide margin around the card. all sides have 16 pixels margin
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // RoundedRectangleBorder to give rounded corners to the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox( //sized box to give fixed height and width to the card
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min, // mainAxisSize to minimize the vertical space occupied by the column
            children: [
            ClipRRect( // ClipRRect to clip the image into a circular shape
              borderRadius: BorderRadius.circular(100), // circular border radius
              child: Image.asset( // Image.asset to load image from assets
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover, // BoxFit.cover to cover the entire area of the image
              ),
            ),
            const SizedBox(height: 16), // SizedBox to provide vertical spacing
            Text( // Text widget to display the name
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // SizedBox to provide vertical spacing
            Text(
              "DOB: $dob",
              style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 36, 36)),
            ),
            ],
          ),
        ),
      ),
    );
  }
}


class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Stateless Widget Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('This widget does not hold state; it shows a static message.'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Stateless button pressed')),
                );
              },
              child: const Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}


class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Stateful Widget Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Counter: $_counter', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Screen"), backgroundColor: const Color.fromARGB(160, 241, 163, 231)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ProfileCard(
                imagePath: "../assets/img1.jpeg",
                name: "Jitesh Boliya",
                dob: "10-05-1998",
                height: 200.0,
                width: 280.0,
              ),
              SizedBox(height: 8),
              StatelessExample(),
              SizedBox(height: 8),
              StatefulExample(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
