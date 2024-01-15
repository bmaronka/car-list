import 'package:bloc_test/bloc_test.dart';
import 'package:car_connect/data/model/offline_error.dart';
import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/domain/person/model/person.dart';
import 'package:car_connect/domain/use_case/car/add_car_use_case.dart';
import 'package:car_connect/domain/use_case/person/get_car_owners_use_case.dart';
import 'package:car_connect/presentation/screens/adding_car_page/cubit/adding_car_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adding_car_cubit_test.mocks.dart';

@GenerateMocks([
  GerCarOwnersUseCase,
  AddCarUseCase,
])
void main() {
  late GerCarOwnersUseCase gerCarOwnersUseCase;
  late AddCarUseCase addCarUseCase;

  late AddingCarCubit cubit;

  final error = DioException(requestOptions: RequestOptions());
  final offlineError = OfflineError(error);
  final owner1 = Person(
    id: 'id1',
    firstName: 'name1',
    lastName: 'lastName1',
    birthDate: DateTime(2023),
    sex: Sex.female,
  );
  final owner2 = Person(
    id: 'id2',
    firstName: 'name2',
    lastName: 'lastName2',
    birthDate: DateTime(2022),
    sex: Sex.male,
  );
  final ownerList = [
    owner1,
    owner2,
  ];
  final emptyCar = Car.empty();
  final car = Car(
    brand: 'brand1',
    model: 'model1',
    color: Colors.yellow,
    registration: 'registration1',
    year: DateTime(2010),
    ownerId: 'id1',
    lat: 40.0,
    lng: 10.0,
  );

  setUp(() {
    gerCarOwnersUseCase = MockGerCarOwnersUseCase();
    addCarUseCase = MockAddCarUseCase();

    cubit = AddingCarCubit(
      gerCarOwnersUseCase,
      addCarUseCase,
    );
  });

  test(
    'has initial loading state',
    () {
      expect(
        cubit.state,
        const AddingCarState.loading(),
      );
    },
  );

  group(
    'test init',
    () {
      blocTest(
        'test init with success',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenAnswer((_) => Future.value(ownerList));

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const AddingCarState.loading(),
          AddingCarState.ownerList(owners: ownerList),
        ],
      );

      blocTest(
        'getting owners with error',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenThrow(error);

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const AddingCarState.loading(),
          AddingCarState.showErrorSnackBar(error),
          const AddingCarState.loading(),
          AddingCarState.error(error),
        ],
      );

      blocTest(
        'getting owners with offline error',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenThrow(offlineError);

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const AddingCarState.loading(),
          AddingCarState.showErrorSnackBar(offlineError),
          const AddingCarState.loading(),
          AddingCarState.error(offlineError),
        ],
      );
    },
  );

  blocTest(
    'test pick owner',
    act: (_) => cubit.pickOwner(owner1),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(ownerId: owner1.id),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test on brand change',
    act: (_) => cubit.onBrandChange('test'),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(brand: 'test'),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test on model change',
    act: (_) => cubit.onModelChange('test'),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(model: 'test'),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test on registeration change',
    act: (_) => cubit.onRegistrationChange('test'),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(registration: 'test'),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test show year picker',
    act: (_) => cubit.showYearPicker(),
    build: () => cubit,
    expect: () => [
      AddingCarState.showYearPicker(selectedYear: DateTime(2023)),
      const AddingCarState.loading(),
    ],
  );

  blocTest(
    'test pick year',
    act: (_) => cubit.pickYear(DateTime(2022, 10, 12)),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(year: DateTime(2022, 10, 12)),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test show color picker',
    act: (_) => cubit.showColorPicker(),
    build: () => cubit,
    expect: () => [
      const AddingCarState.showColorPicker(color: Colors.black),
      const AddingCarState.loading(),
    ],
  );

  blocTest(
    'test pick color',
    act: (_) => cubit.pickColor(Colors.black),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(color: Colors.black),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test show location picker',
    act: (_) => cubit.showLocationPicker(),
    build: () => cubit,
    expect: () => [
      const AddingCarState.showLocationPicker(geoPoint: null),
      const AddingCarState.loading(),
    ],
  );

  blocTest(
    'test pick location',
    act: (_) => cubit.pickLocation(GeoPoint(latitude: 20.0, longitude: 25.0)),
    build: () => cubit,
    expect: () => [
      AddingCarState.carDetails(
        car: emptyCar.copyWith(lat: 20.0, lng: 25.0),
        canProcced: false,
      ),
    ],
  );

  blocTest(
    'test back from car details',
    act: (_) => cubit.backFromCarDetails(),
    build: () => cubit,
    expect: () => [
      const AddingCarState.ownerList(owners: []),
    ],
  );

  group(
    'test add car',
    () {
      Future<void> addCar() async {
        await cubit.init();
        cubit.pickOwner(owner1);
        cubit.onBrandChange('brand1');
        cubit.onModelChange('model1');
        cubit.onRegistrationChange('registration1');
        cubit.pickYear(DateTime(2010));
        cubit.pickColor(Colors.yellow);
        cubit.pickLocation(GeoPoint(latitude: 40.0, longitude: 10.0));
        await cubit.addCar();
      }

      final addCarStates = [
        const AddingCarState.loading(),
        AddingCarState.ownerList(owners: ownerList),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(ownerId: owner1.id),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
          ),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
            model: 'model1',
          ),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
            model: 'model1',
            registration: 'registration1',
          ),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
            model: 'model1',
            registration: 'registration1',
            year: DateTime(2010),
          ),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
            model: 'model1',
            registration: 'registration1',
            year: DateTime(2010),
            color: Colors.yellow,
          ),
          canProcced: false,
        ),
        AddingCarState.carDetails(
          car: emptyCar.copyWith(
            ownerId: owner1.id,
            brand: 'brand1',
            model: 'model1',
            registration: 'registration1',
            year: DateTime(2010),
            color: Colors.yellow,
            lat: 40.0,
            lng: 10.0,
          ),
          canProcced: true,
        ),
        const AddingCarState.loading(),
      ];

      blocTest(
        'test add car with success',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenAnswer((_) => Future.value(ownerList));
          when(addCarUseCase(car)).thenAnswer((_) => Future.value());

          await addCar();
        },
        build: () => cubit,
        expect: () => [
          ...addCarStates,
          AddingCarState.navigateToCarList(newCar: car),
        ],
      );

      blocTest(
        'test add car with error',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenAnswer((_) => Future.value(ownerList));
          when(addCarUseCase(car)).thenThrow(error);

          await addCar();
        },
        build: () => cubit,
        expect: () => [
          ...addCarStates,
          AddingCarState.showErrorSnackBar(error),
          const AddingCarState.loading(),
          AddingCarState.carDetails(
            car: emptyCar.copyWith(
              ownerId: owner1.id,
              brand: 'brand1',
              model: 'model1',
              registration: 'registration1',
              year: DateTime(2010),
              color: Colors.yellow,
              lat: 40.0,
              lng: 10.0,
            ),
            canProcced: true,
          ),
        ],
      );

      blocTest(
        'test add car with offline error',
        act: (_) async {
          when(gerCarOwnersUseCase()).thenAnswer((_) => Future.value(ownerList));
          when(addCarUseCase(car)).thenThrow(offlineError);

          await addCar();
        },
        build: () => cubit,
        expect: () => [
          ...addCarStates,
          AddingCarState.showErrorSnackBar(offlineError),
          const AddingCarState.loading(),
          AddingCarState.carDetails(
            car: emptyCar.copyWith(
              ownerId: owner1.id,
              brand: 'brand1',
              model: 'model1',
              registration: 'registration1',
              year: DateTime(2010),
              color: Colors.yellow,
              lat: 40.0,
              lng: 10.0,
            ),
            canProcced: true,
          ),
        ],
      );
    },
  );
}
