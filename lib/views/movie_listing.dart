import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int selectedTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cinemaSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'One Piece: Stampede (2020) (PG)',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const _MovieDetailRow(label: 'Screen', value: 'Screen 3'),
                const SizedBox(height: 12),
                const _MovieDetailRow(label: 'Date', value: '27 Sep 2026'),
                const SizedBox(height: 12),
                const _MovieDetailRow(label: 'Runtime', value: '19:30 - 22:00'),
                const SizedBox(height: 18),
                const Text(
                  'Adult: £12.00 | Child: £8.00',
                  style: TextStyle(
                    color: cinemaBrandLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: cinemaBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: cinemaBrand.withOpacity(0.4)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: selectedTickets,
                      isExpanded: true,
                      dropdownColor: cinemaSurface,
                      iconEnabledColor: cinemaBrand,
                      style: const TextStyle(color: cinemaFontWhite),
                      items: List.generate(6, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(index.toString()),
                        );
                      }),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedTickets = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Add to Basket'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Members enjoy priority booking and exclusive discounts.',
                  style: TextStyle(
                    color: cinemaBrandLight,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MovieDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _MovieDetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: cinemaFontMuted,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: cinemaFontWhite,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
