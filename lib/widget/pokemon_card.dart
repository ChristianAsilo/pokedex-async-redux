import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonId = pokemon.url.split('/')[6];
    final pokemonImageUrl = imageLink.replaceFirst(indexKey, pokemonId);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PokemonDetailsConnector(pokemon: pokemon),
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pokemon.name,
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Image.network(pokemonImageUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
