import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_details_view.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    Key? key,
    required this.selectedPokemon,
  }) : super(key: key);

  final Async<PokemonDetails> pokemonDetails;
  final String selectedPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pokemonDetailsText),
      ),
      body: pokemonDetails.when(
        (data) => PokemonDetailsView(data: data),
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
  final SnackBar snackBar = SnackBar(
    content: Text(errorMessage ?? emptyString),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
