import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_ability.freezed.dart';

part 'pokemon_ability.g.dart';

@freezed
class PokemonAbility with _$PokemonAbility {
  factory PokemonAbility({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
}
