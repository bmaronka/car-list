import 'package:car_connect/domain/locale/service/locale_service.dart';
import 'package:car_connect/style/locales.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocaleUseCase {
  final LocaleService _localeService;

  const GetLocaleUseCase(this._localeService);

  Future<AppLocale> call() => _localeService.getLocale();
}
