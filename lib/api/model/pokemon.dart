import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
