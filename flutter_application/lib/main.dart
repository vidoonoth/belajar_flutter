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
  HomePageState createState() =>
      HomePageState(); // Menggunakan kelas HomePageState
}

class HomePageState extends State<HomePage> {
  // Perubahan: Hapus garis bawah (_)
  int _currentIndex = 0; // Indeks halaman yang sedang aktif

  // Daftar halaman untuk dipilih
  final List<Widget> _pages = [
    const HomePageContent(), // Halaman pertama
    const BelajarPage(), // Halaman kedua
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Belajar Flutter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Tombol menu
            },
          ),
        ],
      ),
      body: SafeArea(
        child: _pages[_currentIndex], // Tampilkan halaman sesuai indeks
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white, // Warna teks label yang aktif
        unselectedItemColor: Colors.grey, // Warna teks label yang tidak aktif
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        currentIndex: _currentIndex, // Indeks halaman aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Ubah halaman berdasarkan item yang dipilih
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white, // Warna ikon
            ),
            label: 'Beranda', // Label teks
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
              color: Colors.white, // Warna ikon
            ),
            label: 'Nononton', // Label teks
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
    return Container(
      // color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 200,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Belajar Flutter',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              // color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi Anime',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomCard(
                        color: Colors.black,
                        title: 'Doctor Strange',
                        // icon: Icons.access_alarm),
                        image: 'assets/images/drstrange.jpg',
                      ),
                      CustomCard(
                        color: Color.fromARGB(255, 0, 0, 0),
                        title: 'Dandadan',
                        // icon: Icons.access_alarm),
                        image: 'assets/images/dandadan.jpeg',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green[400],
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rekomendasi Drakor',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildCard('Konten 1', Colors.red),
                      _buildCard('Konten 2', Colors.red),
                      _buildCard('Konten 3', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow[700],
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rekomendasi Series',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildCard('Konten 1', Colors.red),
                      _buildCard('Konten 2', Colors.red),
                      _buildCard('Konten 3', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Color color) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.image, required this.title, this.color});

  final String? image; // Ganti icon dengan image
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              // Menggunakan Image untuk mengganti Icon
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(8), // Border radius untuk gambar
                child: Image.asset(
                  image!, // Gambar dari assets
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover, // Menyesuaikan ukuran gambar
                ),
              ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
