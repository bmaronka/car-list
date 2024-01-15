import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/domain/use_case/car/get_car_list_use_case.dart';
import 'package:car_list/utils/safety_cubit.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'car_list_cubit.freezed.dart';
part 'car_list_state.dart';

@injectable
class CarListCubit extends CarConnectCubit<CarListState> {
  CarListCubit(
    this._getCarListUseCase,
  ) : super(const CarListState.loading());

  final GetCarListUseCase _getCarListUseCase;

  final _cars = <Car>[];

  Future<void> init() async => _getCarList();

  Future<void> _getCarList() async {
    emit(const CarListState.loading());

    try {
      final cars = await _getCarListUseCase();
      _cars.clear();
      _cars.addAll(cars);
      _emitLoaded();
    } catch (error, stacktrace) {
      Fimber.e(
        'Error while getting cars',
        ex: error,
        stacktrace: stacktrace,
      );

      _emitListenerState(CarListState.showErrorSnackBar(error));
      emit(CarListState.error(error));
    }
  }

  void _emitLoaded() => emit(
        CarListState.loaded(
          cars: [..._cars],
        ),
      );

  void _emitListenerState(CarListState stateToEmit) {
    final cachedState = state;
    emit(stateToEmit);
    emit(cachedState);
  }
}
