import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepository repository = MovieRepository();
    final List<Movies> movies = repository.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}
