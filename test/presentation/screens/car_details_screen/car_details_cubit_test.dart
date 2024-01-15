import 'package:bloc_test/bloc_test.dart';
import 'package:car_list/data/model/offline_error.dart';
import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/domain/use_case/person/get_car_owner_use_case.dart';
import 'package:car_list/presentation/screens/car_details_screen/cubit/car_details_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'car_details_cubit_test.mocks.dart';

@GenerateMocks([
  GerCarOwnerUseCase,
])
void main() {
  late GerCarOwnerUseCase gerCarOwnerUseCase;

  late CarDetailsCubit cubit;

  final error = DioException(requestOptions: RequestOptions());
  final offlineError = OfflineError(error);

  setUp(() {
    gerCarOwnerUseCase = MockGerCarOwnerUseCase();

    cubit = CarDetailsCubit(
      gerCarOwnerUseCase,
    );
  });

  test(
    'has initial loading state',
    () {
      expect(
        cubit.state,
        const CarDetailsState.loading(),
      );
    },
  );

  group(
    'test init',
    () {
      final owner = Person(
        id: 'id',
        firstName: 'name',
        lastName: 'lastName',
        birthDate: DateTime(2023),
        sex: Sex.female,
      );

      blocTest(
        'test init with success',
        act: (_) async {
          when(gerCarOwnerUseCase(owner.id)).thenAnswer((_) => Future.value(owner));

          await cubit.init(owner.id);
        },
        build: () => cubit,
        expect: () => [
          CarDetailsState.loaded(owner: owner),
        ],
      );

      blocTest(
        'test init with success without owner',
        act: (_) async {
          when(gerCarOwnerUseCase('test')).thenAnswer((_) => Future.value(null));

          await cubit.init('test');
        },
        build: () => cubit,
        expect: () => [
          const CarDetailsState.loaded(owner: null),
        ],
      );

      blocTest(
        'getting cars with error',
        act: (_) async {
          when(gerCarOwnerUseCase(owner.id)).thenThrow(error);

          await cubit.init(owner.id);
        },
        build: () => cubit,
        expect: () => [
          CarDetailsState.showErrorSnackBar(error),
          const CarDetailsState.loading(),
          const CarDetailsState.loaded(owner: null),
        ],
      );

      blocTest(
        'getting cars with offline error',
        act: (_) async {
          when(gerCarOwnerUseCase(owner.id)).thenThrow(offlineError);

          await cubit.init(owner.id);
        },
        build: () => cubit,
        expect: () => [
          CarDetailsState.showErrorSnackBar(offlineError),
          const CarDetailsState.loading(),
          const CarDetailsState.loaded(owner: null),
        ],
      );
    },
  );
}
