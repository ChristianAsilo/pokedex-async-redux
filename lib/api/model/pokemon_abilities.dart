import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon_ability.dart';

part 'pokemon_abilities.freezed.dart';

part 'pokemon_abilities.g.dart';

@freezed
class PokemonAbilities with _$PokemonAbilities {
  factory PokemonAbilities({
    @JsonKey(name: 'ability') required PokemonAbility ability,
  }) = _PokemonAbilities;

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) => _$PokemonAbilitiesFromJson(json);
}
