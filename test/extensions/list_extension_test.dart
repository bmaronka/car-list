import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'test insert to list with one element',
    () {
      final oneElementList = ['test'];
      final insertedList = oneElementList.insertBetweenElements(() => 'test1');

      expect(insertedList, oneElementList);
    },
  );

  test(
    'test insert to list with two elements',
    () {
      final twoElementList = ['test', 'test2'];
      final insertedList = twoElementList.insertBetweenElements(() => 'test1');
      final expected = ['test', 'test1', 'test2'];

      expect(insertedList, expected);
    },
  );

  test(
    'test insert to list with three elements',
    () {
      final threeElementList = ['test', 'test1', 'test2'];
      final insertedList = threeElementList.insertBetweenElements(() => 'test4');
      final expected = ['test', 'test4', 'test1', 'test4', 'test2'];

      expect(insertedList, expected);
    },
  );
}
