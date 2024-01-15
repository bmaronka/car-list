import 'package:car_connect/domain/locale/service/locale_service.dart';
import 'package:car_connect/domain/use_case/locale/get_locale_use_case.dart';
import 'package:car_connect/style/locales.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_locale_use_case_test.mocks.dart';

@GenerateMocks([
  LocaleService,
])
void main() {
  late LocaleService service;
  late GetLocaleUseCase getLocaleUseCase;

  setUp(() {
    service = MockLocaleService();
    getLocaleUseCase = GetLocaleUseCase(service);
  });

  test(
    'get locale',
    () async {
      when(service.getLocale()).thenAnswer((_) => Future.value(AppLocale.pl));

      expect(await getLocaleUseCase(), AppLocale.pl);
    },
  );
}
