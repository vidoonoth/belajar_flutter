import 'package:flutter/material.dart';
import 'anime.dart';
import 'drakor.dart';
// import 'series.dart';

class BelajarPage extends StatefulWidget {
  const BelajarPage({super.key});

  @override
  BelajarPageState createState() => BelajarPageState();
}

class BelajarPageState extends State<BelajarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2); // 4 sesuai jumlah tab
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 23, 23),
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        title: const Center(
          child: Text(
            "Pengaturan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement help action
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement logout action
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: const Color.fromARGB(255, 196, 196, 196),
          // indicatorColor: Colors.white,
          indicator: const BoxDecoration(
            color: Color.fromARGB(255, 86, 86, 86), // Warna lingkaran
            shape: BoxShape.circle, // Bentuk lingkaran
          ),
          tabs: const [
            Padding(
              padding: EdgeInsets.all(8.0), // Padding pada tab
              child: Tab(text: 'Anime'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0), // Padding pada tab
              child: Tab(text: 'Drakor'),
            ),
            // Tab(icon: Icon(Icons.notifications)),
            // Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          AnimeTab(),
          DrakorTab(),
          // Series(),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.image, required this.title, this.color});

  final String? image;  // Ganti icon dengan image
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (image != null)
            // Menggunakan widget Image untuk menampilkan gambar
            Image.asset(
              image!,  // Gambar dari assets (gunakan Image.network jika gambar dari URL)
              height: 50,
              width: 50,
              fit: BoxFit.cover,  // Menyesuaikan ukuran gambar
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
