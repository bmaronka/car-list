import 'package:car_list/data/car/model/car_dto.dart';
import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/utils/date_time_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  test(
    'test mapping from CarDto to Car',
    () {
      final carDto = CarDto(
        'brand1',
        'model1',
        '#000000',
        'registration1',
        DateTime(2023),
        'ownerId1',
        25,
        35,
      );
      final car = Car(
        brand: 'brand1',
        model: 'model1',
        color: HexColor('#000000'),
        registration: 'registration1',
        year: DateTime(2023),
        ownerId: 'ownerId1',
        lat: 25.0,
        lng: 35.0,
      );

      expect(Car.fromCarDto(carDto), car);
    },
  );

  test(
    'test empty constructor',
    () {
      final emptyCar = Car(
        brand: '',
        model: '',
        color: Colors.black,
        registration: '',
        year: null,
        ownerId: '',
      );

      expect(Car.empty(), emptyCar);
    },
  );

  group(
    'test car extensons',
    () {
      final car = Car(
        brand: 'brand1',
        model: 'model1',
        color: HexColor('#000000'),
        registration: 'registration1',
        year: DateTime(2023),
        ownerId: 'ownerId1',
        lat: 25.0,
        lng: 35.0,
      );

      test(
        'test display name',
        () {
          expect(car.displayName, 'brand1 model1');
        },
      );

      test(
        'test tint color',
        () {
          expect(car.tintColor, HexColor('#000000').withOpacity(.1));
        },
      );

      test(
        'test year string',
        () {
          expect(car.yearString, DateTimeFormatter.year(DateTime(2023)));
        },
      );

      test(
        'test color string',
        () {
          expect(car.colorString, '#ff000000');
        },
      );

      test(
        'test location string',
        () {
          expect(car.locationString, '25.00, 35.00');
        },
      );
    },
  );
}
