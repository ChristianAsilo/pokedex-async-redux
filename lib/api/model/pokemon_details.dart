import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon_abilities.dart';
import 'package:pokedex_async_redux/api/model/pokemon_moves.dart';
import 'package:pokedex_async_redux/api/model/pokemon_stats.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'abilities') required List<PokemonAbilities> abilities,
    @JsonKey(name: 'moves') required List<PokemonMoves> moves,
    @JsonKey(name: 'stats') required List<PokemonStats> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
