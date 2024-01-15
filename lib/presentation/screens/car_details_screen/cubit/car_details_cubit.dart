import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/domain/use_case/person/get_car_owner_use_case.dart';
import 'package:car_list/utils/safety_cubit.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'car_details_cubit.freezed.dart';
part 'car_details_state.dart';

@injectable
class CarDetailsCubit extends CarConnectCubit<CarDetailsState> {
  CarDetailsCubit(
    this._getCarOwnerUseCase,
  ) : super(const CarDetailsState.loading());

  final GerCarOwnerUseCase _getCarOwnerUseCase;

  Person? _owner;

  Future<void> init(String ownerId) async {
    await _getOwner(ownerId);
    _emitLoaded();
  }

  Future<void> _getOwner(String ownerId) async {
    try {
      _owner = await _getCarOwnerUseCase(ownerId);
    } catch (error, stacktrace) {
      Fimber.e(
        'Error while getting owner',
        ex: error,
        stacktrace: stacktrace,
      );

      _emitListenerState(CarDetailsState.showErrorSnackBar(error));
    }
  }

  void showCarDetailsDialog() => _emitListenerState(const CarDetailsState.showCarDetailsDialog());

  void _emitLoaded() => emit(
        CarDetailsState.loaded(
          owner: _owner,
        ),
      );

  void _emitListenerState(CarDetailsState stateToEmit) {
    final cachedState = state;
    emit(stateToEmit);
    emit(cachedState);
  }
}
