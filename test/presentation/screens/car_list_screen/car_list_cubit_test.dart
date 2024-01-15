import 'package:bloc_test/bloc_test.dart';
import 'package:car_list/data/model/offline_error.dart';
import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/domain/use_case/car/get_car_list_use_case.dart';
import 'package:car_list/presentation/screens/car_list_screen/cubit/car_list_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'car_list_cubit_test.mocks.dart';

@GenerateMocks([
  GetCarListUseCase,
])
void main() {
  late GetCarListUseCase getCarListUseCase;

  late CarListCubit cubit;

  final error = DioException(requestOptions: RequestOptions());
  final offlineError = OfflineError(error);

  setUp(() {
    getCarListUseCase = MockGetCarListUseCase();

    cubit = CarListCubit(
      getCarListUseCase,
    );
  });

  test(
    'has initial loading state',
    () {
      expect(
        cubit.state,
        const CarListState.loading(),
      );
    },
  );

  group(
    'test init',
    () {
      final cars = [
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

      blocTest(
        'getting cars succesfully',
        act: (_) async {
          when(getCarListUseCase()).thenAnswer((_) => Future.value(cars));

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarListState.loading(),
          CarListState.loaded(cars: cars),
        ],
      );

      blocTest(
        'getting cars with error',
        act: (_) async {
          when(getCarListUseCase()).thenThrow(error);

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarListState.loading(),
          CarListState.showErrorSnackBar(error),
          const CarListState.loading(),
          CarListState.error(error),
        ],
      );

      blocTest(
        'getting cars with offline error',
        act: (_) async {
          when(getCarListUseCase()).thenThrow(offlineError);

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarListState.loading(),
          CarListState.showErrorSnackBar(offlineError),
          const CarListState.loading(),
          CarListState.error(offlineError),
        ],
      );
    },
  );
}
