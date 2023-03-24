import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_card.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
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
          itemBuilder: (_, index) {
            final pokemon = pokemons[index];
            final pokemonId = pokemon.url.split('/')[6];
            final pokemonFinalUrl = imageLink.replaceFirst(indexString, pokemonId);
            return PokemonCard(
              pokemonName: pokemon.name,
              pokemonImage: pokemonFinalUrl,
            );
          },
        ),
      ),
    );
  }
}
