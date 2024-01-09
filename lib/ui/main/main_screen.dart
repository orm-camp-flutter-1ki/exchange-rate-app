import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _baseMoneyController = TextEditingController();
  final _targetMoneyController = TextEditingController();

  @override
  void dispose() {
    _baseMoneyController.dispose();
    _targetMoneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    _baseMoneyController.text = state.baseMoney.toString();
    _targetMoneyController.text = state.targetMoney.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('환율 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 기준 통화 금액 입력 필드
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '기준 통화 금액',
              ),
              controller: _baseMoneyController,
              onChanged: (value) {
                viewModel.inputBaseMoney(num.tryParse(value) ?? 0);
              },
            ),
            // 기준 통화 드롭다운 목록
            DropdownButton<String>(
              value: state.baseCode,
              onChanged: (value) {
                viewModel.inputBaseCode(value!);
              },
              items: viewModel.state.rateResult?.rates
                      .map(
                        (rate) => DropdownMenuItem(
                          value: rate.code,
                          child: Text(rate.code),
                        ),
                      )
                      .toList() ??
                  [],
            ),
            // 대상 통화 금액 입력 필드
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '대상 통화 금액',
              ),
              controller: _targetMoneyController,
              onChanged: (value) {
                viewModel.inputTargetMoney(num.tryParse(value) ?? 0);
              },
            ),
            // 대상 통화 드롭다운 목록
            DropdownButton<String>(
              value: state.targetCode,
              onChanged: (value) {
                viewModel.inputTargetCode(value!);
              },
              items: viewModel.state.rateResult?.rates
                      .map(
                        (rate) => DropdownMenuItem(
                          value: rate.code,
                          child: Text(rate.code),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
