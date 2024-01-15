import 'package:car_connect/utils/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  test(
    'test year date format',
    () {
      final date = DateTime(2023);

      expect(DateTimeFormatter.year(date), '2023');
    },
  );

  test(
    'test pl birthDate date format',
    () {
      const polishLanguageCode = 'pl';
      initializeDateFormatting(polishLanguageCode);

      final date = DateTime(2023, 10, 25);

      expect(DateTimeFormatter.birthDate(date, 'pl'), '25 paź 2023');
    },
  );

  test(
    'test en birthDate date format',
    () {
      const englishLanguageCode = 'en';
      initializeDateFormatting(englishLanguageCode);

      final date = DateTime(2023, 10, 25);

      expect(DateTimeFormatter.birthDate(date, 'en'), 'Oct 25, 2023');
    },
  );
}
