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
}
