import 'package:southsea_cinema/models/movies.dart';

class MovieRepository {
  List<Movies> getMovies() {
    return const [
      Movies(
        id: '1',
        movie: 'One Piece: Stampede (2020) (PG)',
        description:
            'The Straw Hat Pirates attend the Pirate Expo, a festival celebrating the greatest pirates in the world. However, chaos ensues when a mysterious pirate named Douglas Bullet appears and challenges the attendees to a battle.',
        rating: 'PG',
        price: 12.00,
        image: 'images/onepieceposter.png',
      ),
      Movies(
        id: '2',
        movie: 'Kuroroko no Basket: Last Game (2017) (PG)',
        description:
            'The story follows the basketball team of Seirin High School as they face off against a formidable American team in a high-stakes match. The team must overcome their differences and work together to achieve victory.',
        rating: 'PG',
        price: 10.00,
        image: 'images/Kurokos_Basketball_Last_Game.png',
      ),
    ];
  }
}
