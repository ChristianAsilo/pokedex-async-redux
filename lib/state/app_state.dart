import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    //TODO: this will be removed
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
  }) = _AppSate;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
