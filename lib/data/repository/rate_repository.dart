
import '../model/rate_result.dart';

abstract interface class RateRepository {
  Future<RateResult> getRateResult(String baseCode);
}