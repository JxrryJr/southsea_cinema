import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Select Showing'),
                      ),
              ),
              const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                onPressed: () {},
                        child: const Text('Add to Basket'),
                      ),
                    ),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
