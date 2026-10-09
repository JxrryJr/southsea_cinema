import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    movie.imagePath,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: cinemaMovieTitleStyle),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: cinemaBrandDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(movie.ageRating, style: cinemaMetadataStyle),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        movie.synopsis,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: cinemaSynopsisStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${movie.screen}  •  ${movie.screeningDate}',
              style: cinemaMetadataStyle,
            ),
            const SizedBox(height: 4),
            Text(movie.screeningTime, style: cinemaMetadataStyle),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Adult £${movie.adultTicketPrice.toStringAsFixed(2)}\n'
                  'Child £${movie.childTicketPrice.toStringAsFixed(2)}',
                  style: cinemaMetadataStyle,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: cinemaBackground,
                    textStyle: cinemaButtonStyle,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking ${movie.title}')),
                    );
                  },
                  child: const Text('Book now'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
