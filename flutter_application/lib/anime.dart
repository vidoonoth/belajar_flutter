import 'package:flutter/material.dart';

class AnimeTab extends StatelessWidget {
  const AnimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Anime',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Container(
              height: 200,
              color: Colors.amber,
              child: const Row(
                children: [
                  Text('This is the Anime tab'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
