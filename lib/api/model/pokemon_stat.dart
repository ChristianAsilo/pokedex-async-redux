import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat.freezed.dart';

part 'pokemon_stat.g.dart';

@freezed
class PokemonStat with _$PokemonStat {
  factory PokemonStat({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _PPokemonStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);
}
