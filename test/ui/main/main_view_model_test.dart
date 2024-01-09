import 'package:currency_exchange/data/model/rate.dart';
import 'package:currency_exchange/data/model/rate_result.dart';
import 'package:currency_exchange/data/repository/rate_repository.dart';
import 'package:currency_exchange/ui/main/main_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.registerSingleton<RateRepository>(RateRepositoryMock());
    getIt.registerFactory<MainViewModel>(
        () => MainViewModel(rateRepository: getIt<RateRepository>()));
  });

  tearDown(() {
    getIt.reset();
  });

  test('ViewModel 초기화 테스트', () async {
    final viewModel = getIt<MainViewModel>();

    await Future.delayed(const Duration(milliseconds: 500));

    expect(viewModel.state.rateResult, isNotNull);
    expect(viewModel.state.rateResult!.baseCode, 'KRW');
  });

  test('inputBaseMoney 테스트', () async {
    final viewModel = getIt<MainViewModel>();

    await Future.delayed(const Duration(milliseconds: 500));

    viewModel.inputBaseMoney(100);

    expect(viewModel.state.baseMoney, 100);
    expect(viewModel.state.targetMoney, 100 * 0.00076);
  });

  test('inputBaseCode 테스트', () async {
    final viewModel = getIt<MainViewModel>();

    await Future.delayed(const Duration(milliseconds: 500));

    viewModel.inputBaseCode('USD');

    expect(viewModel.state.baseCode, 'USD');
    expect(viewModel.state.targetCode, 'USD');
    expect(viewModel.state.baseMoney, 1);
    expect(viewModel.state.targetMoney, 1);
  });
}

class RateRepositoryMock implements RateRepository {
  final krwMockJson = {
    "result": "success",
    "provider": "https://www.exchangerate-api.com",
    "documentation": "https://www.exchangerate-api.com/docs/free",
    "terms_of_use": "https://www.exchangerate-api.com/terms",
    "time_last_update_unix": 1704758551,
    "time_last_update_utc": "Tue, 09 Jan 2024 00:02:31 +0000",
    "time_next_update_unix": 1704845261,
    "time_next_update_utc": "Wed, 10 Jan 2024 00:07:41 +0000",
    "time_eol_unix": 0,
    "base_code": "KRW",
    "rates": {
      "KRW": 1,
      "AED": 0.002792,
      "AFN": 0.054018,
      "ALL": 0.072881,
      "AMD": 0.307074,
      "ANG": 0.001361,
      "AOA": 0.639312,
      "ARS": 0.618626,
      "AUD": 0.001134,
      "AWG": 0.001361,
      "AZN": 0.001277,
      "BAM": 0.001355,
      "BBD": 0.00152,
      "BDT": 0.083526,
      "BGN": 0.001355,
      "BHD": 0.000286,
      "BIF": 2.157407,
      "BMD": 0.00076,
      "BND": 0.00101,
      "BOB": 0.005155,
      "BRL": 0.00371,
      "BSD": 0.00076,
      "BTN": 0.063204,
      "BWP": 0.010212,
      "BYN": 0.002466,
      "BZD": 0.00152,
      "CAD": 0.001016,
      "CDF": 2.061947,
      "CHF": 0.000645,
      "CLP": 0.675501,
      "CNY": 0.00544,
      "COP": 3.006501,
      "CRC": 0.391776,
      "CUP": 0.018243,
      "CVE": 0.076407,
      "CZK": 0.017043,
      "DJF": 0.13509,
      "DKK": 0.005176,
      "DOP": 0.043031,
      "DZD": 0.101028,
      "EGP": 0.023472,
      "ERN": 0.011402,
      "ETB": 0.042855,
      "EUR": 0.000694,
      "FJD": 0.001683,
      "FKP": 0.000597,
      "FOK": 0.005177,
      "GBP": 0.000597,
      "GEL": 0.00204,
      "GGP": 0.000597,
      "GHS": 0.009061,
      "GIP": 0.000597,
      "GMD": 0.04942,
      "GNF": 6.499427,
      "GTQ": 0.005835,
      "GYD": 0.158611,
      "HKD": 0.005929,
      "HNL": 0.018404,
      "HRK": 0.005221,
      "HTG": 0.100431,
      "HUF": 0.261673,
      "IDR": 11.810431,
      "ILS": 0.002822,
      "IMP": 0.000597,
      "INR": 0.063205,
      "IQD": 0.991489,
      "IRR": 32.507921,
      "ISK": 0.104385,
      "JEP": 0.000597,
      "JMD": 0.11524,
      "JOD": 0.000539,
      "JPY": 0.109608,
      "KES": 0.11681,
      "KGS": 0.06762,
      "KHR": 3.106667,
      "KID": 0.001134,
      "KMF": 0.340906,
      "KWD": 0.000232,
      "KYD": 0.000633,
      "KZT": 0.346024,
      "LAK": 15.344931,
      "LBP": 11.401846,
      "LKR": 0.244529,
      "LRD": 0.14232,
      "LSL": 0.014198,
      "LYD": 0.00364,
      "MAD": 0.007529,
      "MDL": 0.013275,
      "MGA": 3.477612,
      "MKD": 0.042808,
      "MMK": 1.910888,
      "MNT": 2.625007,
      "MOP": 0.006113,
      "MRU": 0.029991,
      "MUR": 0.03345,
      "MVR": 0.011508,
      "MWK": 1.282179,
      "MXN": 0.012804,
      "MYR": 0.00354,
      "MZN": 0.048429,
      "NAD": 0.014198,
      "NGN": 0.629414,
      "NIO": 0.027283,
      "NOK": 0.007884,
      "NPR": 0.101127,
      "NZD": 0.001219,
      "OMR": 0.000292,
      "PAB": 0.00076,
      "PEN": 0.002817,
      "PGK": 0.002773,
      "PHP": 0.042377,
      "PKR": 0.212305,
      "PLN": 0.003014,
      "PYG": 5.493489,
      "QAR": 0.002767,
      "RON": 0.003448,
      "RSD": 0.081319,
      "RUB": 0.069155,
      "RWF": 0.985445,
      "SAR": 0.00285,
      "SBD": 0.006264,
      "SCR": 0.010162,
      "SDG": 0.338663,
      "SEK": 0.007783,
      "SGD": 0.00101,
      "SHP": 0.000597,
      "SLE": 0.017437,
      "SLL": 17.436839,
      "SOS": 0.433086,
      "SRD": 0.027692,
      "SSP": 0.830509,
      "STN": 0.016977,
      "SYP": 9.611737,
      "SZL": 0.014198,
      "THB": 0.026553,
      "TJS": 0.008322,
      "TMT": 0.00266,
      "TND": 0.00234,
      "TOP": 0.001764,
      "TRY": 0.022694,
      "TTD": 0.004967,
      "TVD": 0.001134,
      "TWD": 0.023529,
      "TZS": 1.909491,
      "UAH": 0.028974,
      "UGX": 2.883594,
      "USD": 0.00076,
      "UYU": 0.029487,
      "UZS": 9.363219,
      "VES": 0.027318,
      "VND": 18.459928,
      "VUV": 0.090168,
      "WST": 0.002052,
      "XAF": 0.454541,
      "XCD": 0.002052,
      "XDR": 0.000568,
      "XOF": 0.454541,
      "XPF": 0.08269,
      "YER": 0.186557,
      "ZAR": 0.014198,
      "ZMW": 0.01967,
      "ZWL": 4.892676
    }
  };
  final usdMockJson = {"result":"success","provider":"https://www.exchangerate-api.com","documentation":"https://www.exchangerate-api.com/docs/free","terms_of_use":"https://www.exchangerate-api.com/terms","time_last_update_unix":1704758551,"time_last_update_utc":"Tue, 09 Jan 2024 00:02:31 +0000","time_next_update_unix":1704845421,"time_next_update_utc":"Wed, 10 Jan 2024 00:10:21 +0000","time_eol_unix":0,"base_code":"USD","rates":{"USD":1,"AED":3.6725,"AFN":71.254789,"ALL":96.131794,"AMD":405.337806,"ANG":1.79,"AOA":843.247302,"ARS":813.85,"AUD":1.490106,"AWG":1.79,"AZN":1.699553,"BAM":1.785834,"BBD":2,"BDT":109.63174,"BGN":1.785939,"BHD":0.376,"BIF":2840.450627,"BMD":1,"BND":1.329058,"BOB":6.805652,"BRL":4.876135,"BSD":1,"BTN":83.089181,"BWP":13.585306,"BYN":3.230002,"BZD":2,"CAD":1.336326,"CDF":2697.633434,"CHF":0.848628,"CLP":890.921544,"CNY":7.162024,"COP":3965.875801,"CRC":517.078193,"CUP":24,"CVE":100.681007,"CZK":22.392465,"DJF":177.721,"DKK":6.81154,"DOP":56.816276,"DZD":133.358324,"EGP":30.863593,"ERN":15,"ETB":56.568054,"EUR":0.913083,"FJD":2.207559,"FKP":0.785088,"FOK":6.811502,"GBP":0.78523,"GEL":2.686743,"GGP":0.785088,"GHS":11.951077,"GIP":0.785088,"GMD":65.227475,"GNF":8573.496849,"GTQ":7.70299,"GYD":209.253267,"HKD":7.806956,"HNL":24.296492,"HRK":6.879618,"HTG":132.38535,"HUF":344.638586,"IDR":15522.235626,"ILS":3.708074,"IMP":0.785088,"INR":83.0892,"IQD":1308.108484,"IRR":42103.415759,"ISK":137.696951,"JEP":0.785088,"JMD":154.442744,"JOD":0.709,"JPY":144.210309,"KES":157.484083,"KGS":89.068448,"KHR":4097.715555,"KID":1.490069,"KMF":449.206988,"KRW":1315.579762,"KWD":0.307069,"KYD":0.833333,"KZT":454.049468,"LAK":20260.160449,"LBP":15000,"LKR":322.172003,"LRD":187.908238,"LSL":18.600643,"LYD":4.801157,"MAD":9.934524,"MDL":17.497456,"MGA":4588.602603,"MKD":56.316592,"MMK":2069.285389,"MNT":3448.928652,"MOP":8.041281,"MRU":39.549165,"MUR":44.19766,"MVR":15.426819,"MWK":1691.041552,"MXN":16.850777,"MYR":4.650896,"MZN":63.877268,"NAD":18.600643,"NGN":901.917434,"NIO":36.019513,"NOK":10.366248,"NPR":132.94269,"NZD":1.601223,"OMR":0.384497,"PAB":1,"PEN":3.703239,"PGK":3.66135,"PHP":55.706694,"PKR":280.789085,"PLN":3.963127,"PYG":7250.108997,"QAR":3.64,"RON":4.544375,"RSD":107.186309,"RUB":90.944137,"RWF":1298.987519,"SAR":3.75,"SBD":8.461342,"SCR":13.527227,"SDG":454.050784,"SEK":10.235285,"SGD":1.329059,"SHP":0.785088,"SLE":22.939497,"SLL":22939.497173,"SOS":571.351664,"SRD":36.540045,"SSP":1094.832204,"STN":22.370514,"SYP":12692.813615,"SZL":18.600643,"THB":34.952358,"TJS":10.951297,"TMT":3.500002,"TND":3.095189,"TOP":2.319731,"TRY":29.917017,"TTD":6.693079,"TVD":1.490069,"TWD":30.887894,"TZS":2517.434848,"UAH":38.207941,"UGX":3803.533186,"UYU":38.915574,"UZS":12334.343292,"VES":35.9385,"VND":24282.515533,"VUV":118.701752,"WST":2.707098,"XAF":598.942651,"XCD":2.7,"XDR":0.748595,"XOF":598.942651,"XPF":108.959923,"YER":246.292762,"ZAR":18.600721,"ZMW":25.941524,"ZWL":6436.683388}};

  @override
  Future<RateResult> getRateResult(String baseCode) async {
    if (baseCode == 'KRW') {
      try {
        final rates = krwMockJson['rates'] as Map<String, num>;
        final nextTimestamp = krwMockJson['time_next_update_unix'];
        final lastTimestamp = krwMockJson['time_last_update_unix'];
        return RateResult(
          baseCode: baseCode,
          rates:
          rates.entries.map((e) => Rate(code: e.key, rate: e.value)).toList(),
          lastUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((lastTimestamp as int) * 1000),
          nextUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((nextTimestamp as int) * 1000),
        );
      } catch (error) {
        rethrow; // Rethrow to allow for further error handling
      }
    } else if (baseCode == 'USD') {
      try {
        final rates = usdMockJson['rates'] as Map<String, num>;
        final nextTimestamp = usdMockJson['time_next_update_unix'];
        final lastTimestamp = usdMockJson['time_last_update_unix'];
        return RateResult(
          baseCode: baseCode,
          rates:
          rates.entries.map((e) => Rate(code: e.key, rate: e.value)).toList(),
          lastUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((lastTimestamp as int) * 1000),
          nextUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((nextTimestamp as int) * 1000),
        );
      } catch (error) {
        rethrow; // Rethrow to allow for further error handling
      }
    } else {
      throw Exception('Not implemented');
    }
  }
}
