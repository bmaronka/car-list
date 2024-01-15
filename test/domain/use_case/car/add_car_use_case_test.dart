import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/domain/car/service/car_service.dart';
import 'package:car_connect/domain/use_case/car/add_car_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_car_list_use_case_test.mocks.dart';

@GenerateMocks([
  CarService,
])
void main() {
  late CarService service;
  late AddCarUseCase addCarUseCase;

  setUp(() {
    service = MockCarService();
    addCarUseCase = AddCarUseCase(service);
  });

  test(
    'add car',
    () async {
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

      when(service.addCar(car)).thenAnswer((_) => Future.value());

      await addCarUseCase(car);

      verify(service.addCar(car));
    },
  );
}
