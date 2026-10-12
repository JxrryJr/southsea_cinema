import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';

Movie createMovie({String ageRating = 'PG'}) {
  return Movie(
    id: 'test-movie',
    title: 'Test Movie',
    ageRating: ageRating,
    synopsis: 'A test movie synopsis.',
    screen: 'Screen 1',
    screeningDate: '12 October 2026',
    screeningTime: '19:30 - 21:30',
    adultTicketPrice: 12,
    childTicketPrice: 8,
    imagePath: 'assets/images/test_movie.jpg',
  );
}

void main() {
  group('Movie model', () {
    test('assigns constructor properties', () {
      final movie = createMovie();

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.ageRating, 'PG');
      expect(movie.synopsis, 'A test movie synopsis.');
      expect(movie.screen, 'Screen 1');
      expect(movie.screeningDate, '12 October 2026');
      expect(movie.screeningTime, '19:30 - 21:30');
      expect(movie.adultTicketPrice, 12);
      expect(movie.childTicketPrice, 8);
      expect(movie.imagePath, 'assets/images/test_movie.jpg');
    });

    test('formats the adult ticket price to two decimal places', () {
      final movie = createMovie();

      expect(movie.formattedPrice, '£12.00');
    });

    group('age rating suitability', () {
      test('U and PG movies are child friendly', () {
        expect(createMovie(ageRating: 'U').isChildFriendly, isTrue);
        expect(createMovie(ageRating: 'PG').isChildFriendly, isTrue);
      });

      test('18 movies are adult only', () {
        expect(createMovie(ageRating: '18').isAdultOnly, isTrue);
      });

      test('other ratings are not child friendly or adult only', () {
        final movie = createMovie(ageRating: '12A');

        expect(movie.isChildFriendly, isFalse);
        expect(movie.isAdultOnly, isFalse);
      });
    });
  });
}
