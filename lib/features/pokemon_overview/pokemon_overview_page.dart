import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widget/pokemon_card.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchPokemons,
    required this.onSearchPokemons,
    required this.onClearSearchedPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchPokemons;
  final ValueChanged onSearchPokemons;
  final VoidCallback onClearSearchedPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController _searchText;
  late bool _isCurrentlySearching;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _isCurrentlySearching = false;
    _searchText = TextEditingController()..addListener(_onSearchPokemons);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchText.dispose();
    if (widget.searchPokemons.isNotEmpty) {
      widget.onSearchPokemons(emptyString);
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
            controller: _searchText,
            decoration: InputDecoration(
              icon: const Icon(Icons.search),
              hintText: searchPokemonText,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _clearSearchedPokemon(),
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.pokemons.when(
            (pokemons) {
              final pokemonsToDisplay = _isCurrentlySearching ? widget.searchPokemons : pokemons;
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

  void _onSearchPokemons() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () => _searchingPokemon());
  }

  void _searchingPokemon() {
    _isCurrentlySearching = true;
    widget.onSearchPokemons(_searchText.text);
  }

  void _clearSearchedPokemon() {
    _searchText.clear();
    widget.onSearchPokemons(emptyString);
    widget.onClearSearchedPokemons();
    setState(() => _isCurrentlySearching = false);
  }
}
