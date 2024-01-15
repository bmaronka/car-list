import 'package:bloc_test/bloc_test.dart';
import 'package:car_list/domain/locale/service/locale_service.dart';
import 'package:car_list/domain/use_case/locale/get_locale_use_case.dart';
import 'package:car_list/domain/use_case/locale/notify_locale_changed_stream_use_case.dart';
import 'package:car_list/domain/use_case/locale/save_locale_use_case.dart';
import 'package:car_list/domain/use_case/locale/subscribe_locale_changed_stream_use_case.dart';
import 'package:car_list/presentation/widgets/car_connect_app_bar/cubit/car_connect_app_bar_cubit.dart';
import 'package:car_list/style/locales.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'car_connect_app_bar_cubit_test.mocks.dart';

@GenerateMocks([
  GetLocaleUseCase,
  SaveLocaleUseCase,
  SubscribeLocaleChangedStreamUseCase,
  NotifyLocaleChangedStreamUseCase,
])
void main() {
  late GetLocaleUseCase getLocaleUseCase;
  late SaveLocaleUseCase saveLocaleUseCase;
  late SubscribeLocaleChangedStreamUseCase subscribeLocaleChangedStreamUseCase;
  late NotifyLocaleChangedStreamUseCase notifyLocaleChangedStreamUseCase;

  late CarConnectAppBarCubit cubit;

  final error = Exception();

  setUp(() {
    getLocaleUseCase = MockGetLocaleUseCase();
    saveLocaleUseCase = MockSaveLocaleUseCase();
    subscribeLocaleChangedStreamUseCase = MockSubscribeLocaleChangedStreamUseCase();
    notifyLocaleChangedStreamUseCase = MockNotifyLocaleChangedStreamUseCase();

    cubit = CarConnectAppBarCubit(
      saveLocaleUseCase,
      getLocaleUseCase,
      notifyLocaleChangedStreamUseCase,
      subscribeLocaleChangedStreamUseCase,
    );
  });

  test(
    'has initial empty idle state',
    () {
      expect(
        cubit.state,
        const CarConnectAppBarState.idle(locale: null),
      );
    },
  );

  group(
    'test init',
    () {
      const locale = AppLocale.pl;

      blocTest(
        'getting locale succesfully',
        act: (_) async {
          when(getLocaleUseCase()).thenAnswer((_) => Future.value(locale));
          when(subscribeLocaleChangedStreamUseCase()).thenAnswer((_) => const Stream.empty());

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarConnectAppBarState.switchLocale(locale),
          const CarConnectAppBarState.idle(locale: null),
          const CarConnectAppBarState.idle(locale: locale),
        ],
      );

      blocTest(
        'getting locale with error',
        act: (_) async {
          when(getLocaleUseCase()).thenThrow(error);
          when(subscribeLocaleChangedStreamUseCase()).thenAnswer((_) => const Stream.empty());

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          CarConnectAppBarState.showErrorSnackBar(error),
          const CarConnectAppBarState.idle(locale: null),
          const CarConnectAppBarState.switchLocale(locale),
          const CarConnectAppBarState.idle(locale: null),
          const CarConnectAppBarState.idle(locale: locale),
        ],
      );
    },
  );

  group(
    'test _listenToLocaleChanged',
    () {
      const oldLocale = AppLocale.pl;
      const newLocale = AppLocale.en;

      blocTest(
        'switching locale succesfully',
        act: (_) async {
          when(getLocaleUseCase()).thenAnswer((_) => Future.value(oldLocale));
          when(saveLocaleUseCase(newLocale)).thenAnswer((_) => Future.value());
          when(subscribeLocaleChangedStreamUseCase()).thenAnswer((_) => Stream.value(LocaleEvent.localeChanged));

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarConnectAppBarState.switchLocale(oldLocale),
          const CarConnectAppBarState.idle(locale: null),
          const CarConnectAppBarState.idle(locale: oldLocale),
          const CarConnectAppBarState.switchLocale(newLocale),
          const CarConnectAppBarState.idle(locale: oldLocale),
          const CarConnectAppBarState.idle(locale: newLocale),
        ],
      );

      blocTest(
        'switching locale with error',
        act: (_) async {
          when(getLocaleUseCase()).thenAnswer((_) => Future.value(oldLocale));
          when(saveLocaleUseCase(newLocale)).thenThrow(error);
          when(subscribeLocaleChangedStreamUseCase()).thenAnswer((_) => Stream.value(LocaleEvent.localeChanged));

          await cubit.init();
        },
        build: () => cubit,
        expect: () => [
          const CarConnectAppBarState.switchLocale(oldLocale),
          const CarConnectAppBarState.idle(locale: null),
          const CarConnectAppBarState.idle(locale: oldLocale),
          CarConnectAppBarState.showErrorSnackBar(error),
          const CarConnectAppBarState.idle(locale: oldLocale),
        ],
      );
    },
  );
}
