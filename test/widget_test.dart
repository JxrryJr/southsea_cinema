import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/screens/movie_screen.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';
import 'package:southsea_cinema/widgets/responsive_scaffold.dart';

void main() {
  test('movie formats ticket prices', () {
    final movie = MovieRepository().getMovies().first;

    expect(movie.formattedPrice, 'Adult £12.00\nChild £8.00');
  });

  testWidgets('initial screen renders the movie listing', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.text('Book One Piece: Stampede'), findsOneWidget);
    expect(find.text('One Piece: Stampede (2020) (PG)'), findsOneWidget);
    expect(find.text('Screen 3'), findsOneWidget);
    expect(find.text('Book now'), findsOneWidget);
  });

  testWidgets('movie listing works in isolation', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final Movie movie = MovieRepository().getMovies().first;
    await tester.pumpWidget(
      MaterialApp(
        home: MovieListing(movie: movie),
      ),
    );

    expect(find.text('Book One Piece: Stampede'), findsOneWidget);
    expect(find.text('Screen 3'), findsOneWidget);
  });

  testWidgets('isolated movie listing updates the ticket selection',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final Movie movie = MovieRepository().getMovies().first;
    await tester.pumpWidget(
      MaterialApp(
        home: MovieListing(movie: movie),
      ),
    );

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('3').last);
    await tester.pumpAndSettle();

    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('home page shows the movie booking details', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.text('Book One Piece: Stampede'), findsOneWidget);
    expect(find.text('One Piece: Stampede (2020) (PG)'), findsOneWidget);
    expect(find.text('Screen 3'), findsOneWidget);
    expect(find.text('Adult: £12.00 | Child: £8.00'), findsOneWidget);
    expect(find.text('Book now'), findsOneWidget);
  });

  testWidgets('ticket dropdown changes the selected number', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2').last);
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('tapping Book now navigates to MovieScreen with selected movie',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.tap(find.text('Book now').last);
    await tester.pumpAndSettle();

    expect(find.byType(MovieScreen), findsOneWidget);
    expect(find.text('Now showing'), findsOneWidget);
    expect(find.text('One Piece: Stampede'), findsOneWidget);
  });

  testWidgets('booking a selected movie opens MovieScreen', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final movie = MovieRepository().getMovies().first;
    await tester.pumpWidget(
      MaterialApp(
        home: MovieListing(movie: movie),
      ),
    );

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1').last);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Book now'));
    await tester.pumpAndSettle();

    expect(find.byType(MovieScreen), findsOneWidget);
    expect(find.text('Now showing'), findsOneWidget);
    expect(find.text('One Piece: Stampede'), findsOneWidget);
  });

  testWidgets('responsive scaffold uses wider padding on wide screens',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResponsiveScaffold(body: SizedBox(key: Key('page-body'))),
      ),
    );

    await tester.binding.setSurfaceSize(const Size(500, 800));
    await tester.pump();
    final narrowPadding = tester.widget<Padding>(
      find
          .ancestor(
            of: find.byKey(const Key('page-body')),
            matching: find.byType(Padding),
          )
          .first,
    );

    await tester.binding.setSurfaceSize(const Size(1000, 800));
    await tester.pump();
    final widePadding = tester.widget<Padding>(
      find
          .ancestor(
            of: find.byKey(const Key('page-body')),
            matching: find.byType(Padding),
          )
          .first,
    );

    expect(
      narrowPadding.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
    expect(
      widePadding.padding,
      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
    );
    addTearDown(() => tester.binding.setSurfaceSize(null));
  });
}
