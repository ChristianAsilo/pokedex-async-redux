import 'package:async_redux/async_redux.dart';
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
        searchedPokemons: state.searchedPokemons,
        getSearchedPokemon: (searchText) => getSearchedPokemon(searchText),
        clearSearchedPokemons: () => clearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }

  void getSearchedPokemon(String searchText) => dispatchSync(SearchPokemonsAction(searchText: searchText));

  void clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.searchedPokemons,
    required this.getSearchedPokemon,
    required this.pokemons,
    required this.clearSearchedPokemons,
  }) : super(equals: [pokemons, searchedPokemons]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final Function(String) getSearchedPokemon;
  final Function() clearSearchedPokemons;
}
