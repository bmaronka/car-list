// Mocks generated by Mockito 5.4.2 from annotations
// in car_list/test/presentation/screens/adding_car_screen/adding_car_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:car_list/domain/car/model/car.dart' as _i6;
import 'package:car_list/domain/person/model/person.dart' as _i4;
import 'package:car_list/domain/use_case/car/add_car_use_case.dart' as _i5;
import 'package:car_list/domain/use_case/person/get_car_owners_use_case.dart' as _i2;
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

/// A class which mocks [GerCarOwnersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGerCarOwnersUseCase extends _i1.Mock implements _i2.GerCarOwnersUseCase {
  MockGerCarOwnersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Person>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Person>>.value(<_i4.Person>[]),
      ) as _i3.Future<List<_i4.Person>>);
}

/// A class which mocks [AddCarUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddCarUseCase extends _i1.Mock implements _i5.AddCarUseCase {
  MockAddCarUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> call(_i6.Car? car) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [car],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
