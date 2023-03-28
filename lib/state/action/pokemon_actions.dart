import 'dart:async';

import 'package:async_redux/async_redux.dart';
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
class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.pokemonName});

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}
