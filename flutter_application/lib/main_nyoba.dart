import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:logger/logger.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nononton',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black), // Warna teks putih
        ),
        actions: [
          const Icon(Icons.person),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            SectionTitle(title: 'New Releases'),
            NewReleasesSection(),
            SectionTitle(title: 'Categories'),
            CategoriesSection(),
            SizedBox(height: 16),
            SectionTitle(title: 'Movies Being Watched'),
            MoviesBeingWatchedSection(),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: Colors.black,
        color: Colors.black,
        items: const[
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => Logger(),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white), // Warna teks putih
      ),
    );
  }
}

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const[
          MovieCard(
            title: 'Doctor Strange',
            imagePath: 'assets/images/drstrange.jpg',
          ),
          MovieCard(
            title: 'Dandadan',
            imagePath: 'assets/images/dandadan.jpeg',
          ),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const[
          CategoryButton(label: 'All'),
          CategoryButton(label: 'Action'),
          CategoryButton(label: 'Comedy'),
        ],
      ),
    );
  }
}

class MoviesBeingWatchedSection extends StatelessWidget {
  const MoviesBeingWatchedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          MovieCard(
            title: 'Doctor Strange',
            imagePath: 'assets/images/drstrange.jpg',
          ),
          MovieCard(
            title: 'A Man called Otto',
            imagePath: 'assets/images/amancalledotto.jpeg',
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const MovieCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.white), // Warna teks putih
          ),
        ],
      ),
    );
  }
}


class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(color: Colors.black), // Warna teks putih
        ),
      ),
    );
  }
}
