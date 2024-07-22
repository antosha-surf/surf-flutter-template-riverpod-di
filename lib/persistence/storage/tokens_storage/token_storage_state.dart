import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_storage_state.freezed.dart';
part 'token_storage_state.g.dart';

/// A snapshot of the token storage state.
@freezed
class TokenStorageState with _$TokenStorageState {
  /// @nodoc.
  const factory TokenStorageState({
    required List<String> tokens,
    required String? currentlyUsedToken,
  }) = _TokenStorageState;

  /// @nodoc.
  factory TokenStorageState.fromJson(Map<String, dynamic> json) =>
      _$TokenStorageStateFromJson(json);
}
