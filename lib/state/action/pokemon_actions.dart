import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex_async_redux/api/model/api_service.dart';
import 'package:pokedex_async_redux/state/action/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

///Getting of pokemons from pokemon api
class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemon-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offset, limit: limit);

    return state.copyWith(pokemons: pokemons);
  }
}

///Getting of pokemon details from pokemon api
class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemon-details-action';

  GetPokemonDetailsAction({required this.pokemonName}) : super(actionKey: key);

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}

///Dispose the pokemonDetails when return to overview page
class DisposePokemonDetailAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(pokemonDetails: null);
}

/// Search and filter pokemons
class SearchPokemonsAction extends ReduxAction<AppState> {
  SearchPokemonsAction({required this.searchText});

  final String searchText;

  @override
  AppState reduce() {
    final searchedPokemon =
        state.pokemons.filter((pokemon) => pokemon.name.contains(searchText.toLowerCase())).toList();
    return state.copyWith(searchedPokemons: searchedPokemon);
  }
}

/// Clearing searchedPokemons state when presses the (X) button
class ClearSearchedPokemonsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copyWith(searchedPokemons: List.empty());
  }
}
