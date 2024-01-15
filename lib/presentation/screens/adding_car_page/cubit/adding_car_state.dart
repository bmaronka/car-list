part of 'adding_car_cubit.dart';

@freezed
class AddingCarState with _$AddingCarState {
  @Implements<AddingCarStateBuilder>()
  const factory AddingCarState.loading() = _AddingCarStateLoading;

  @Implements<AddingCarStateBuilder>()
  const factory AddingCarState.ownerList({
    required List<Person> owners,
  }) = _AddingCarStateOwnerList;

  @Implements<AddingCarStateBuilder>()
  const factory AddingCarState.carDetails({
    required Car car,
    required bool canProcced,
  }) = _AddingCarStateCarDetails;

  @Implements<AddingCarStateBuilder>()
  const factory AddingCarState.error(Object error) = _AddingCarStateError;

  @Implements<AddingCarStateListener>()
  const factory AddingCarState.showErrorSnackBar(Object error) = _AddingCarStateShowErrorSnackBar;

  @Implements<AddingCarStateListener>()
  const factory AddingCarState.showYearPicker({required DateTime selectedYear}) = _AddingCarStateShowYearPicker;

  @Implements<AddingCarStateListener>()
  const factory AddingCarState.showColorPicker({required Color color}) = _AddingCarStateShowColorPicker;

  @Implements<AddingCarStateListener>()
  const factory AddingCarState.showLocationPicker({
    required GeoPoint? geoPoint,
  }) = _AddingCarStateShowLocationPicker;

  @Implements<AddingCarStateListener>()
  const factory AddingCarState.navigateToCarList({
    required Car newCar,
  }) = _AddingCarStateNavigateToCarList;
}

abstract class AddingCarStateBuilder {}

abstract class AddingCarStateListener {}
