import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: Will be removed later
    StoreProvider.dispatch(context, GetPokemonsAction());

    //Todo: Will be removed later
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: pokemonName));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //TODO: will be placed in constant later
          title: const Text('Home Page'),
        ),
        body: const Center(
          //TODO: will be placed in constant later
          child: Text('This is Home Page'),
        ),
      ),
    );
  }
}
