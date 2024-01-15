import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/domain/car/service/car_service.dart';
import 'package:car_connect/domain/use_case/car/get_car_list_use_case.dart';
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
  late GetCarListUseCase getCarListUseCase;

  setUp(() {
    service = MockCarService();
    getCarListUseCase = GetCarListUseCase(service);
  });

  test(
    'get car list',
    () async {
      final carList = [
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

      when(service.getCarList()).thenAnswer((_) => Future.value(carList));

      expect(await getCarListUseCase(), carList);
    },
  );
}
