part of 'car_details_cubit.dart';

@freezed
class CarDetailsState with _$CarDetailsState {
  @Implements<CarDetailsStateBuilder>()
  const factory CarDetailsState.loading() = _CarDetailsStateLoading;

  @Implements<CarDetailsStateBuilder>()
  const factory CarDetailsState.loaded({
    required Person? owner,
  }) = _CarDetailsStateLoaded;

  @Implements<CarDetailsStateListener>()
  const factory CarDetailsState.showErrorSnackBar(Object error) = _CarDetailsStateShowErrorSnackBar;

  @Implements<CarDetailsStateListener>()
  const factory CarDetailsState.showCarDetailsDialog() = _CarDetailsStateShowCarDetailsDialog;
}

abstract class CarDetailsStateBuilder {}

abstract class CarDetailsStateListener {}
