import 'package:flutter/material.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';
import 'package:southsea_cinema/screens/movie_screen.dart';

void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = MovieRepository().getMovies().first;

    return MaterialApp(
      title: "Southsea Cinema & Arts Centre",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MovieListing(movie: movie),
        '/movie': (context) => MovieScreen(movie: movie),
        '/listing': (context) => MovieListing(movie: movie),
      },
    );
  }
}
