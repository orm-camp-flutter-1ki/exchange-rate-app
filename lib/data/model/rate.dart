import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'rate.freezed.dart';

part 'rate.g.dart';

@freezed
class Rate with _$Rate {
  const factory Rate({
    required String code,
    required num rate,
  }) = _Rate;

  factory Rate.fromJson(Map<String, Object?> json) => _$RateFromJson(json);
}