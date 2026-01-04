import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // final isWide = constraints.maxWidth > 600;
          final text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Created By',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                'Jitesh Boliya - Full Stack developer',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          );

          Future<void> launchURL(String urlString) async {
            final Uri url = Uri.parse(urlString);
            // if (kIsWeb) {
            //   await launchUrl(url); // web-safe
            // } else {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            // }
          }

          final icons = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  launchURL('https://www.linkedin.com/in/jiteshboliya/');
                },
                icon: const Image(
                  image: AssetImage('assets/icon/linkedin.png'),
                  height: 24,
                  width: 24,
                ),
              ), // Linkedin
              IconButton(
                onPressed: () {
                  launchURL('https://github.com/JiteshBoliya');
                },
                icon: const Image(
                  image: AssetImage('assets/icon/github.png'),
                  height: 24,
                  width: 24,
                ),
              ), // Github
              IconButton(
                onPressed: () {
                  launchURL('https://www.instagram.com/jitesh_boliya_');
                },
                icon: const Image(
                  image: AssetImage('assets/icon/instagram.png'),
                  height: 24,
                  width: 24,
                ),
              ), // Instagram
            ],
          );

          // if (isWide) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [text, icons],
          );
          // }

          // return Column(children: [text, const SizedBox(height: 12), icons]);
        },
      ),
    );
  }
}
