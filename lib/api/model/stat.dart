import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/stat_info.dart';

part 'stat.freezed.dart';

part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @JsonKey(name: 'base_stat') required int baseStat,
    @JsonKey(name: 'stat') required StatInfo stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
