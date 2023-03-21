import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_info.freezed.dart';

part 'stat_info.g.dart';

@freezed
class StatInfo with _$StatInfo {
  factory StatInfo({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _StatInfo;

  factory StatInfo.fromJson(Map<String, dynamic> json) => _$StatInfoFromJson(json);
}
