import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    //TODO: this will be removed
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
    @Default(<Pokemon>[]) List<Pokemon> searchedPokemons,
    @Default(null) PokemonDetails? pokemonDetails,

    // ignored by state
    @Default(Wait.empty) @JsonKey(ignore: true) Wait wait,
  }) = _AppSate;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
