import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/responsive_scaffold.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
  });

  testWidgets('uses wider page padding in a wide window', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ResponsiveScaffold(body: SizedBox(key: Key('page-body'))),
      ),
    );

    await tester.binding.setSurfaceSize(const Size(500, 800));
    await tester.pump();
    final narrowPadding = tester.widget<Padding>(
      find.ancestor(
        of: find.byKey(const Key('page-body')),
        matching: find.byType(Padding),
      ).first,
    );

    await tester.binding.setSurfaceSize(const Size(1000, 800));
    await tester.pump();
    final widePadding = tester.widget<Padding>(
      find.ancestor(
        of: find.byKey(const Key('page-body')),
        matching: find.byType(Padding),
      ).first,
    );

    expect(narrowPadding.padding, const EdgeInsets.symmetric(horizontal: 16, vertical: 16));
    expect(widePadding.padding, const EdgeInsets.symmetric(horizontal: 32, vertical: 32));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  });
}
