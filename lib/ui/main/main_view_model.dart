import 'package:currency_exchange/data/repository/rate_repository.dart';
import 'package:flutter/material.dart';

import 'main_state.dart';

class MainViewModel extends ChangeNotifier {
  final RateRepository _rateRepository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required RateRepository rateRepository,
  }) : _rateRepository = rateRepository {
    _updateRateResult(state.baseCode);
  }

  Future<void> _updateRateResult(String baseCode) async {
    final result = await _rateRepository.getRateResult(baseCode);
    _state = state.copyWith(rateResult: result);
    notifyListeners();
  }

  void inputBaseMoney(num baseMoney) {
    _state = state.copyWith(
      baseMoney: baseMoney,
      targetMoney: baseMoney *
          state.rateResult!.rates
              .firstWhere((rate) => rate.code == state.targetCode)
              .rate,
    );
    notifyListeners();
  }

  void inputBaseCode(String baseCode) async {
    _state = state.copyWith(
      baseCode: baseCode,
      targetMoney: state.baseMoney *
          state.rateResult!.rates
              .firstWhere((rate) => rate.code == baseCode)
              .rate,
    );
    notifyListeners();
  }

  void inputTargetMoney(num targetMoney) {
    _state = state.copyWith(
      targetMoney: targetMoney,
      baseMoney: targetMoney /
          state.rateResult!.rates
              .firstWhere((rate) => rate.code == state.targetCode)
              .rate,
    );
    notifyListeners();
  }

  void inputTargetCode(String targetCode) {
    _state = state.copyWith(
      targetCode: targetCode,
      targetMoney: state.baseMoney *
          state.rateResult!.rates
              .firstWhere((rate) => rate.code == targetCode)
              .rate,
    );
    notifyListeners();
  }
}
