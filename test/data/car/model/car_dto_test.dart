import 'dart:ui';

import 'package:car_list/data/car/model/car_dto.dart';
import 'package:car_list/domain/car/model/car.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'test mapping from Car to CarDto',
    () {
      final car = Car(
        brand: 'brand1',
        model: 'model1',
        color: const Color(0xFF3F0D42),
        registration: 'registration1',
        year: DateTime(2023),
        ownerId: 'ownerId1',
        lat: 25,
        lng: 35,
      );
      final carDto = CarDto(
        'brand1',
        'model1',
        '#3f0d42',
        'registration1',
        DateTime(2023),
        'ownerId1',
        25.0,
        35.0,
      );

      expect(CarDto.fromCar(car), carDto);
    },
  );
}
