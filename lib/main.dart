import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/api_service.dart';
import 'package:pokedex_async_redux/home_page.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

//TODO: Future will be removed later
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  //TODO: To be removed later
  final pokemons = await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;

  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
}
