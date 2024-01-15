part of 'car_list_cubit.dart';

@freezed
class CarListState with _$CarListState {
  @Implements<CarListStateBuilder>()
  const factory CarListState.loading() = _CarListStateLoading;

  @Implements<CarListStateBuilder>()
  const factory CarListState.loaded({
    required List<Car> cars,
  }) = _CarListStateLoaded;

  @Implements<CarListStateBuilder>()
  const factory CarListState.error(Object error) = _CarListStateError;

  @Implements<CarListStateListener>()
  const factory CarListState.showErrorSnackBar(Object error) = _CarListStateShowErrorSnackBar;
}

abstract class CarListStateBuilder {}

abstract class CarListStateListener {}
