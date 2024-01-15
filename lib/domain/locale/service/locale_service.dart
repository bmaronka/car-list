import 'package:car_connect/style/locales.dart';

abstract class LocaleService {
  Future<void> saveLocale(AppLocale locale);

  Future<AppLocale> getLocale();

  void notifyLocaleChanged(LocaleEvent event);

  Stream<LocaleEvent> getLocaleChangedStream();
}

enum LocaleEvent {
  localeChanged,
}
