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
          "Nononton",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
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
      padding: const EdgeInsets.all(0.5),
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
                  'Nononton',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi Anime',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'One Piece',
                          image: 'assets/images/onepiece.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Dandadan',
                          image: 'assets/images/dandadan.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Solo Leveling',
                          image: 'assets/images/solo-leveling.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Jujutsu Kaisen',
                          image: 'assets/images/jujutsu-kaisen.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Bleach',
                          image: 'assets/images/bleach.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Naruto',
                          image: 'assets/images/naruto.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Dragon Ball',
                          image: 'assets/images/dragon-ball.jpeg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi Drama Korea (drakor)',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Vincenzo',
                          image: 'assets/images/vincenzo.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Family by choice',
                          image: 'assets/images/family-by-choice.jpeg',
                        ),
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Train to Busan',
                          image: 'assets/images/train-to-busan.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Our Beloved Summer',
                          image: 'assets/images/our-beloved-summer.jpeg',
                        ),
                        SizedBox(width: 5), // Spacer between cards

                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'Welcome To Samdal-ri',
                          image: 'assets/images/welcome-to-samdal-ri.jpeg',
                        ),

                        SizedBox(width: 5), // Spacer between cards
                        CustomCard(
                          color: Color.fromARGB(255, 7, 7, 7),
                          title: 'True Beauty',
                          image: 'assets/images/true-beauty.jpeg',
                        ),
                      ],
                    ),
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

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.image, required this.title, this.color});

  final String? image; // Ganti icon dengan image
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        color: color,
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              softWrap:
                  true, // Membiarkan teks turun ke bawah jika terlalu panjang
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
