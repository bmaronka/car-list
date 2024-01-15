import 'dart:ui';

import 'package:car_connect/data/car/data_source/car_data_source.dart';
import 'package:car_connect/data/car/model/car_dto.dart';
import 'package:car_connect/data/car/service/car_service_impl.dart';
import 'package:car_connect/domain/car/model/car.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'car_service_impl_test.mocks.dart';

@GenerateMocks([
  CarDataSource,
])
void main() {
  late CarServiceImpl service;
  late CarDataSource dataSource;

  setUp(() {
    dataSource = MockCarDataSource();

    service = CarServiceImpl(dataSource);
  });

  test(
    'get car list',
    () async {
      final carListDto = [
        CarDto(
          'brand1',
          'model1',
          '#000000',
          'registration1',
          DateTime(2023),
          'ownerId1',
          25,
          35,
        ),
        CarDto(
          'brand2',
          'model2',
          '#111111',
          'registration2',
          DateTime(2023),
          'ownerId2',
          35,
          45,
        ),
      ];
      final expected = [
        Car(
          brand: 'brand1',
          model: 'model1',
          color: HexColor('#000000'),
          registration: 'registration1',
          year: DateTime(2023),
          ownerId: 'ownerId1',
          lat: 25.0,
          lng: 35.0,
        ),
        Car(
          brand: 'brand2',
          model: 'model2',
          color: HexColor('#111111'),
          registration: 'registration2',
          year: DateTime(2023),
          ownerId: 'ownerId2',
          lat: 35.0,
          lng: 45.0,
        ),
      ];

      when(dataSource.getCarList()).thenAnswer((_) => Future.value(carListDto));

      final cars = await service.getCarList();

      expect(cars, equals(expected));
    },
    skip: 'Until connecting to backend',
  );

  test(
    'add car',
    () async {
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

      when(dataSource.addCar(carDto)).thenAnswer((_) => Future.value());

      await service.addCar(car);

      verify(dataSource.addCar(carDto));
    },
    skip: 'Until connecting to backend',
  );
}
