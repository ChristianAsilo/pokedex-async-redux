import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_details_view.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;
  final Async<PokemonDetails> pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokemonDetailsText)),
      body: pokemonDetails.when(
        (data) => PokemonDetailsView(pokemonDetails: data, pokemon: pokemon),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackBar(context, errorMessage));
          return const Center(child: Text(noPokemonDetailsAvailable));
        },
      ),
    );
  }
}

void _showErrorMessageSnackBar(BuildContext context, String? errorMessage) {
  final SnackBar snackBar = SnackBar(content: Text(errorMessage ?? emptyString));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
