part of 'car_connect_app_bar_cubit.dart';

@freezed
class CarConnectAppBarState with _$CarConnectAppBarState {
  @Implements<CarConnectAppBarStateBuilder>()
  const factory CarConnectAppBarState.idle({
    required AppLocale? locale,
  }) = _CarConnectAppBarStateIdle;

  @Implements<CarConnectAppBarStateListener>()
  const factory CarConnectAppBarState.showErrorSnackBar(Object error) = _CarConnectAppBarStateShowErrorSnackBar;

  @Implements<CarConnectAppBarStateListener>()
  const factory CarConnectAppBarState.switchLocale(AppLocale locale) = _CarConnectAppBarStateSwitchLocale;
}

abstract class CarConnectAppBarStateBuilder {}

abstract class CarConnectAppBarStateListener {}
