import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    pokemons;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(appBarTitle)),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            final pokemonIndex = index + defaultOne;
            return Card(
              child: Padding(
                padding: cardPadding,
                child: Column(
                  crossAxisAlignment: crossAlignmentCenter,
                  children: [
                    Text(
                      pokemon.name,
                      style: textSize,
                    ),
                    Expanded(
                      child: Image.network(
                        '$imageLink$pokemonIndex.png',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
