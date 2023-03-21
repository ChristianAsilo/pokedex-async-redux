import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon_move.dart';

part 'pokemon_moves.freezed.dart';

part 'pokemon_moves.g.dart';

@freezed
class PokemonMoves with _$PokemonMoves {
  factory PokemonMoves({
    @JsonKey(name: 'move') required PokemonMove move,
  }) = _PokemonMoves;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) => _$PokemonMovesFromJson(json);
}
