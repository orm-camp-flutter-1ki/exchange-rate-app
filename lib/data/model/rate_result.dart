import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'rate.dart';

part 'rate_result.freezed.dart';

part 'rate_result.g.dart';

@freezed
class RateResult with _$RateResult {
  const factory RateResult({
    required DateTime lastUpdateTime,
    required DateTime nextUpdateTime,
    required String baseCode,
    required List<Rate> rates,
  }) = _RateResult;

  factory RateResult.fromJson(Map<String, Object?> json) => _$RateResultFromJson(json);
}