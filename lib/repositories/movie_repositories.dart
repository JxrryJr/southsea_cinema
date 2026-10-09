import 'package:southsea_cinema/models/movies.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'one-piece-stampede',
        title: 'One Piece: Stampede',
        ageRating: 'PG',
        synopsis:
            'The Straw Hat Pirates attend the Pirate Expo, a festival celebrating the greatest pirates in the world. However, chaos ensues when a mysterious pirate named Douglas Bullet appears and challenges the attendees to a battle.',
        screen: 'Screen 3',
        screeningDate: '27 September 2026',
        screeningTime: '19:30 – 22:00',
        adultTicketPrice: 12.00,
        childTicketPrice: 8.00,
        imagePath: 'assets/images/one_piece_stampede.jpg',
      ),
      Movie(
        id: 'kurokos-basketball-last-game',
        title: "Kuroko's Basketball: Last Game",
        ageRating: 'PG',
        synopsis:
            'The story follows the basketball team of Seirin High School as they face off against a formidable American team in a high-stakes match. The team must overcome their differences and work together to achieve victory.',
        screen: 'Screen 1',
        screeningDate: '28 September 2026',
        screeningTime: '16:15 – 18:10',
        adultTicketPrice: 10.00,
        childTicketPrice: 6.50,
        imagePath: 'assets/images/kurokos_basketball_last_game.jpg',
      ),
    ];
  }
}
