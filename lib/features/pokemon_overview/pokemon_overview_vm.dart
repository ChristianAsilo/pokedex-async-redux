import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        searchPokemons: state.searchedPokemons,
        onSearchPokemons: (searchText) => _onSearchPokemons(searchText),
        onClearSearchedPokemons: () => _clearSearchedPokemons(),
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }

  void _onSearchPokemons(searchText) => dispatchSync(SearchPokemonsAction(searchText: searchText));

  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.searchPokemons,
    required this.onSearchPokemons,
    required this.pokemons,
    required this.onClearSearchedPokemons,
  }) : super(equals: [pokemons, searchPokemons]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchPokemons;
  final ValueChanged onSearchPokemons;
  final VoidCallback onClearSearchedPokemons;
}
