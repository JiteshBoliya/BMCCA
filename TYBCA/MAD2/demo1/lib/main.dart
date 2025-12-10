import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Cards App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String dob;
  final double height;
  final double width;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.dob,
    this.height = 320.0,
    this.width = 250.0,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
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


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Screen"), backgroundColor: Color.fromARGB(160, 241, 163, 231)),
      body: const Center(
        child: ProfileCard(
          imagePath: "../assets/img1.jpeg",
          name: "Jitesh Boliya",
          dob: "10-05-1998",
          height: 360.0,
          width: 280.0,
        ),
      ),
    );
  }
}
