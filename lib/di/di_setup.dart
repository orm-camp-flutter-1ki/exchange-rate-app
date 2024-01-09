import 'package:currency_exchange/data/repository/rate_repository.dart';
import 'package:currency_exchange/data/repository/rate_repository_mock.dart';
import 'package:currency_exchange/ui/main/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RateRepository>(RateRepositoryMock());
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(rateRepository: getIt<RateRepository>()));
}
