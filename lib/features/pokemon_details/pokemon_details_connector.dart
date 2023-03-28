import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({Key? key, required this.selectedPokemon}) : super(key: key);

  final String selectedPokemon;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: selectedPokemon)),
      onDispose: (store) => store.dispatchAsync(DisposePokemonDetailAction()),
      builder: (context, vm) => PokemonDetailsPage(
        pokemonDetails: vm.pokemonDetails,
        selectedPokemon: selectedPokemon,
      ),
    );
  }
}
