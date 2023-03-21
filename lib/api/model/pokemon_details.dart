import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/ability.dart';
import 'package:pokedex_async_redux/api/model/move.dart';
import 'package:pokedex_async_redux/api/model/stat.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'abilities') required List<Ability> abilities,
    @JsonKey(name: 'moves') required List<Move> moves,
    @JsonKey(name: 'stats') required List<Stat> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
