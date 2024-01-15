import 'package:car_connect/domain/locale/service/locale_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotifyLocaleChangedStreamUseCase {
  final LocaleService _localeService;

  const NotifyLocaleChangedStreamUseCase(this._localeService);

  void call() => _localeService.notifyLocaleChanged(LocaleEvent.localeChanged);
}
