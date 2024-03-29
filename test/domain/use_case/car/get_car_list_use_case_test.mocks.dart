// Mocks generated by Mockito 5.4.2 from annotations
// in car_list/test/domain/use_case/car/get_car_list_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:car_list/domain/car/model/car.dart' as _i4;
import 'package:car_list/domain/car/service/car_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCarService extends _i1.Mock implements _i2.CarService {
  MockCarService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Car>> getCarList() => (super.noSuchMethod(
        Invocation.method(
          #getCarList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Car>>.value(<_i4.Car>[]),
      ) as _i3.Future<List<_i4.Car>>);

  @override
  _i3.Future<void> addCar(_i4.Car? car) => (super.noSuchMethod(
        Invocation.method(
          #addCar,
          [car],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
