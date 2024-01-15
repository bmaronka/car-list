import 'package:car_connect/domain/locale/service/locale_service.dart';
import 'package:car_connect/domain/use_case/locale/save_locale_use_case.dart';
import 'package:car_connect/style/locales.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_locale_use_case_test.mocks.dart';

@GenerateMocks([
  LocaleService,
])
void main() {
  late LocaleService service;
  late SaveLocaleUseCase saveLocaleUseCase;

  setUp(() {
    service = MockLocaleService();
    saveLocaleUseCase = SaveLocaleUseCase(service);
  });

  test(
    'get locale',
    () async {
      when(service.saveLocale(AppLocale.pl)).thenAnswer((_) => Future.value());

      await saveLocaleUseCase(AppLocale.pl);

      verify(service.saveLocale(AppLocale.pl));
    },
  );
}
