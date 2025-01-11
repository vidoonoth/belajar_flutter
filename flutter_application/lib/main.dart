import 'package:flutter/material.dart';
import 'belajar.dart'; // Import halaman kedua

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nononton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Set HomePage sebagai halaman pertama
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const BelajarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.home, color: Colors.white, size: 30),
        title: const Text(
          "Nononton",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie, color: Colors.white),
            label: 'Nononton',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 200,
            child: const Center(
              child: Text(
                'Nononton',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SectionTitle(title: "Rekomendasi Anime"),
          const AnimeList(),
          const SectionTitle(title: "Rekomendasi Drama Korea (drakor)"),
          const DramaList(),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> animes = [
      {"title": "One Piece", "image": "assets/images/onepiece.jpeg"},
      {"title": "Dandadan", "image": "assets/images/dandadan.jpeg"},
      {"title": "Solo Leveling", "image": "assets/images/solo-leveling.jpeg"},
      {"title": "Jujutsu Kaisen", "image": "assets/images/jujutsu-kaisen.jpeg"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: animes.map((anime) {
          return CustomCard(
            title: anime['title']!,
            image: anime['image']!,
            color: Colors.black,
          );
        }).toList(),
      ),
    );
  }
}

class DramaList extends StatelessWidget {
  const DramaList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dramas = [
      {"title": "Vincenzo", "image": "assets/images/vincenzo.jpeg"},
      {
        "title": "Family by Choice",
        "image": "assets/images/family-by-choice.jpeg"
      },
      {"title": "Train to Busan", "image": "assets/images/train-to-busan.jpeg"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dramas.map((drama) {
          return CustomCard(
            title: drama['title']!,
            image: drama['image']!,
            color: Colors.black,
          );
        }).toList(),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key, required this.image, required this.title, this.color});

  final String image;
  final String title;
  final Color? color;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorited = false; // Status favorit

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isFavorited = !isFavorited; // Toggle status favorit
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
