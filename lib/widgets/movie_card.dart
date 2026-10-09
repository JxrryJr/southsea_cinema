import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';

class MovieCard extends StatelessWidget {
  final Movies movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(movie.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.movie,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              movie.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('£${movie.price.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    // Handle ticket purchase logic here
                  },
                  child: Text('Buy Ticket (\$${movie.price.toStringAsFixed(2)})'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 