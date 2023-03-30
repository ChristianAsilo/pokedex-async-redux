import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_card.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemon,
    required this.filterPokemon,
    required this.clearSearchedPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemon;
  final Function(String) filterPokemon;
  final Function() clearSearchedPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  TextEditingController searchText = TextEditingController();
  bool isSearching = false;
  Timer? timer;

  @override
  void dispose() {
    searchText.dispose();
    if (widget.searchedPokemon.isNotEmpty) {
      widget.filterPokemon(emptyString);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appbarTitle)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            onChanged: (searchText) {
              searchingPokemon(searchText);
            },
            controller: searchText,
            decoration: InputDecoration(
              icon: const Icon(Icons.search),
              hintText: searchPokemonText,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => clearSearchedPokemon(),
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.pokemons.when(
            (data) {
              final pokemonsToDisplay = isSearching ? widget.searchedPokemon : data;
              if (pokemonsToDisplay.isEmpty) {
                return const Center(child: Text(noSearchResultText, style: textStyle));
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: pokemonsToDisplay.length,
                  itemBuilder: (_, index) {
                    final pokemon = pokemonsToDisplay[index];
                    return PokemonCard(pokemon: pokemon);
                  },
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (errorMessage) {
              WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackBar(context, errorMessage));
              return const Center(child: Text(noPokemonAvailable));
            },
          ),
        ),
      ]),
    );
  }

  void _showErrorMessageSnackBar(BuildContext context, String? errorMessage) {
    final SnackBar snackBar = SnackBar(
      content: Text(errorMessage ?? emptyString),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void searchingPokemon(searchText) {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        isSearching = true;
        widget.filterPokemon(searchText);
      });
    });
  }

  void clearSearchedPokemon() {
    searchText.clear();
    widget.filterPokemon(emptyString);
    widget.clearSearchedPokemons();
  }
}
