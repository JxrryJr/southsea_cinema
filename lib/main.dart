import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/screens/movie_screen.dart';

void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Southsea Cinema & Arts Centre",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MovieScreen(),
        '/listing': (context) => const MovieListing(),
      },
    );
  }
}
