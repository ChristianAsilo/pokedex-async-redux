import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_card.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    void _showErrorMessageSnackbar(String? errorMessage) {
      final SnackBar snackBar = SnackBar(
        content: Text(errorMessage!),
        duration: const Duration(seconds: 5),
      );
      key.currentState?.showSnackBar(snackBar);
    }

    return MaterialApp(
        scaffoldMessengerKey: key,
        home: Scaffold(
          appBar: AppBar(title: const Text(appbarTitle)),
          body: pokemons.when(
              (data) => GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      final pokemon = data[index];
                      return PokemonCard(pokemon: pokemon);
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (errorMessage) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showErrorMessageSnackbar(errorMessage);
                });
                return const Center(child: Text(noPokemonAvailable));
              }),
        ));
  }
}
