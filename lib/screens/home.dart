import 'package:anime_flutter/network/animeapi.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Anime List',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1),
              ),
            ),
            Anime(
              animeType: '/v4/anime',
            ),
            Text(
              'Recommended',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
            ),
            Anime(animeType: '/v4/recommendations/anime')
          ],
        ),
      ),
    ]);
  }
}
