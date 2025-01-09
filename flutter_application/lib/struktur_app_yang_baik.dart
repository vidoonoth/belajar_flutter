import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug
      title: 'Aplikasi Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Sederhana'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: SafeArea(
        // Memastikan konten tidak terpotong oleh area status bar
        child: SingleChildScrollView(
          // Membuat konten dapat di-scroll
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Selamat datang di aplikasi sederhana!',
                ),
              ),
              const SizedBox(height: 20),
              _buildCard('Konten 1', Colors.red),
              _buildCard('Konten 2', Colors.green),
              _buildCard('Konten 3', Colors.blue),
              _buildCard('Konten 4', Colors.yellow),
              _buildCard('Konten 5', Colors.orange),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat card
  Widget _buildCard(String title, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: color,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
