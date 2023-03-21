import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move.freezed.dart';

part 'pokemon_move.g.dart';

@freezed
class PokemonMove with _$PokemonMove {
  factory PokemonMove({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _PokemonMove;

  factory PokemonMove.fromJson(Map<String, dynamic> json) => _$PokemonMoveFromJson(json);
}
