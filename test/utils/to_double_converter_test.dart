import 'package:car_list/utils/to_double_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'nullable convert',
    () {
      expect(convertToDouble(null), null);
    },
  );

  test(
    'double convert',
    () {
      expect(convertToDouble(2.0), 2.0);
    },
  );

  test(
    'int convert',
    () {
      expect(convertToDouble(5), 5.0);
    },
  );

  test(
    'string convert',
    () {
      expect(convertToDouble('5.0'), 5.0);
    },
  );

  test(
    'bool convert',
    () {
      expect(convertToDouble(false), null);
    },
  );
}
