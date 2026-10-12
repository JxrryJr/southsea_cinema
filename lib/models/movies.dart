/// Immutable information needed to show and book one cinema screening.
class Movie {
  final String id;
  final String title;
  final String ageRating;
  final String synopsis;
  final String screen;
  final String screeningDate;
  final String screeningTime;
  final double adultTicketPrice;
  final double childTicketPrice;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.ageRating,
    required this.synopsis,
    required this.screen,
    required this.screeningDate,
    required this.screeningTime,
    required this.adultTicketPrice,
    required this.childTicketPrice,
    required this.imagePath,
  });

  String get formattedPrice => '£${adultTicketPrice.toStringAsFixed(2)}';

  String get formattedChildPrice => '£${childTicketPrice.toStringAsFixed(2)}';

  bool get isChildFriendly => ageRating == 'U' || ageRating == 'PG';

  bool get isAdultOnly => ageRating == '18';
}
