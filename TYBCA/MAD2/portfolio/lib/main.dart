import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final int page = (_controller.page ?? 0).round();
      if (page != _currentPage) {
        setState(() => _currentPage = page);
      }
    });
  }

  Widget _buildPage(String text) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  // Experience cards replaced by a dedicated widget below for animations

  @override
  Widget build(BuildContext context) {
    // AnimatedContainer changes gradient smoothly when `_currentPage` changes
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _currentPage == 0
              ? [Colors.grey, Colors.black]
              : [const Color.fromARGB(255, 6, 77, 99), const Color.fromARGB(255, 144, 177, 185)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _controller,
          children: [
          // First page with a right-centered arrow
          Stack(
            children: [
              _buildPage('hello Developers'),
              // Animated scale on the arrow for tactile feedback
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: InkResponse(
                      radius: 28,
                      splashColor: Colors.white24,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 1.0),
                        duration: const Duration(milliseconds: 200),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Second page with circular image above text and scrollable experience
          // Second page with circular image above text and scrollable experience
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // open fullscreen Hero image
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const FullscreenImage(),
                    ));
                  },
                  child: Hero(
                    tag: 'profile-hero',
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage('../assets/profile.jpeg'),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  "I'm Eva Smith",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 28),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Work Experience',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Demo experiences - use animated interactive cards
                ExperienceCard(
                  title: 'Frontend Developer',
                  company: 'Company A',
                  period: '2022 — 2023',
                  desc: 'Built responsive web interfaces and improved performance by 30%.',
                ),
                ExperienceCard(
                  title: 'Mobile Developer',
                  company: 'Company B',
                  period: '2020 — 2022',
                  desc: 'Developed cross-platform Flutter apps and maintained CI/CD pipelines.',
                ),
                ExperienceCard(
                  title: 'Software Intern',
                  company: 'Company C',
                  period: '2019',
                  desc: 'Assisted with testing, bug fixes, and documentation.',
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

// Animated, interactive experience card
class ExperienceCard extends StatefulWidget {
  final String title;
  final String company;
  final String period;
  final String desc;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.period,
    required this.desc,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _anim.forward();
      } else {
        _anim.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 0.98).animate(CurvedAnimation(parent: _anim, curve: Curves.easeOut)),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Card(
            color: Colors.white10,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: _toggle,
              splashColor: Colors.white12,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                            fontSize: 18,
                          ),
                        ),
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 0.5).animate(_anim),
                          child: const Icon(Icons.expand_more, color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${widget.company} • ${widget.period}',
                      style: const TextStyle(color: Colors.white70, fontFamily: 'monospace', fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Text(widget.desc, style: const TextStyle(color: Colors.white70, fontFamily: 'monospace', fontSize: 14)),
                      crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Fullscreen image page for Hero animation
class FullscreenImage extends StatelessWidget {
  const FullscreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Hero(
          tag: 'profile-hero',
          child: Image.asset('assets/profile.jpg'),
        ),
      ),
    );
  }
}
