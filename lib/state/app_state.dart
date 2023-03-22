import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    //TODO: this will be removed
    @Default('') String sample,
  }) = _AppSate;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
