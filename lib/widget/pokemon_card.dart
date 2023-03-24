import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemonName,
    required this.pokemonImage,
    Key? key,
  }) : super(key: key);

  final String pokemonName;
  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: cardPadding,
        child: Column(
          crossAxisAlignment: crossAlignmentCenter,
          children: [
            Text(
              pokemonName,
              style: textSize,
            ),
            Expanded(
              child: Image.network(pokemonImage),
            ),
          ],
        ),
      ),
    );
  }
}
