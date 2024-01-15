import 'package:car_connect/domain/locale/service/locale_service.dart';
import 'package:car_connect/style/locales.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveLocaleUseCase {
  final LocaleService _localeService;

  const SaveLocaleUseCase(this._localeService);

  Future<void> call(AppLocale locale) => _localeService.saveLocale(locale);
}
