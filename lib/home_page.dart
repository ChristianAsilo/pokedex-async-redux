import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, GetPokemonsAction());

    StoreProvider.dispatch(context, GetPokemonDetailsAction());

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
