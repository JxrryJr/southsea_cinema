import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';

void main() {
  final repository = MovieRepository();

  group('MovieRepository', () {
    test('returns valid movies', () {
      final movies = repository.getMovies();
      final ids = movies.map((movie) => movie.id).toSet();

      expect(movies.length, greaterThanOrEqualTo(2));
      expect(ids.length, movies.length);

      for (final movie in movies) {
        expect(movie.id, isNotEmpty);
        expect(movie.title, isNotEmpty);
        expect(movie.ageRating, isNotEmpty);
        expect(movie.adultTicketPrice, greaterThan(0));
      }
    });

    test('finds a movie by an existing id', () {
      final expected = repository.getMovies().first;

      final movie = repository.getMovieById(expected.id);

      expect(movie, same(expected));
    });

    test('returns null for a missing id', () {
      expect(repository.getMovieById('missing-movie'), isNull);
    });

    test('filters movies by age rating', () {
      final movies = repository.getMoviesByAgeRating('PG');

      expect(movies, isNotEmpty);
      expect(movies.every((movie) => movie.ageRating == 'PG'), isTrue);
    });

    test('filters movies under the adult ticket price', () {
      final movies = repository.getMoviesUnderPrice(11);

      expect(movies, isNotEmpty);
      expect(
        movies.every((movie) => movie.adultTicketPrice < 11),
        isTrue,
      );
    });
  });
}
