import 'dart:ui';

import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/domain/person/model/person.dart';
import 'package:car_connect/domain/use_case/car/add_car_use_case.dart';
import 'package:car_connect/domain/use_case/person/get_car_owners_use_case.dart';
import 'package:car_connect/utils/safety_cubit.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'adding_car_cubit.freezed.dart';
part 'adding_car_state.dart';

@injectable
class AddingCarCubit extends CarConnectCubit<AddingCarState> {
  AddingCarCubit(
    this._gerCarOwnersUseCase,
    this._addCarUseCase,
  ) : super(const AddingCarState.loading());

  final GerCarOwnersUseCase _gerCarOwnersUseCase;
  final AddCarUseCase _addCarUseCase;

  final _owners = <Person>[];
  Car _car = Car.empty();

  bool get _canProcced =>
      _car.brand.isNotEmpty &&
      _car.model.isNotEmpty &&
      _car.registration.isNotEmpty &&
      _car.year != null &&
      _car.lat != null &&
      _car.lng != null;

  Future<void> init() async => _getOwnerList();

  Future<void> _getOwnerList() async {
    emit(const AddingCarState.loading());

    try {
      final owners = await _gerCarOwnersUseCase();
      _owners.addAll(owners);
      emit(AddingCarState.ownerList(owners: _owners));
    } catch (error, stacktrace) {
      Fimber.e(
        'Error while getting owners',
        ex: error,
        stacktrace: stacktrace,
      );

      _emitListenerState(AddingCarState.showErrorSnackBar(error));
      emit(AddingCarState.error(error));
    }
  }

  void pickOwner(Person owner) {
    _car = _car.copyWith(ownerId: owner.id);
    _emitCarDetails();
  }

  void onBrandChange(String? value) {
    _car = _car.copyWith(brand: value ?? '');
    _emitCarDetails();
  }

  void onModelChange(String? value) {
    _car = _car.copyWith(model: value ?? '');
    _emitCarDetails();
  }

  void onRegistrationChange(String? value) {
    _car = _car.copyWith(registration: value ?? '');
    _emitCarDetails();
  }

  void showYearPicker() => _emitListenerState(AddingCarState.showYearPicker(selectedYear: _car.year ?? DateTime(2023)));

  void pickYear(DateTime year) {
    _car = _car.copyWith(year: year);
    _emitCarDetails();
  }

  void showColorPicker() => _emitListenerState(AddingCarState.showColorPicker(color: _car.color));

  void pickColor(Color color) {
    _car = _car.copyWith(color: color);
    _emitCarDetails();
  }

  void showLocationPicker() => _emitListenerState(
        AddingCarState.showLocationPicker(
          geoPoint: _car.lat != null && _car.lng != null ? GeoPoint(latitude: _car.lat!, longitude: _car.lng!) : null,
        ),
      );

  void pickLocation(GeoPoint geoPoint) {
    _car = _car.copyWith(lat: geoPoint.latitude, lng: geoPoint.longitude);
    _emitCarDetails();
  }

  Future<void> addCar() async {
    emit(const AddingCarState.loading());

    try {
      await _addCarUseCase(_car);
      emit(AddingCarState.navigateToCarList(newCar: _car));
    } catch (error, stacktrace) {
      Fimber.e(
        'Error while adding new car',
        ex: error,
        stacktrace: stacktrace,
      );

      _emitListenerState(AddingCarState.showErrorSnackBar(error));
      _emitCarDetails();
    }
  }

  void backFromCarDetails() => emit(AddingCarState.ownerList(owners: _owners));

  void _emitCarDetails() => emit(
        AddingCarState.carDetails(
          car: _car,
          canProcced: _canProcced,
        ),
      );

  void _emitListenerState(AddingCarState stateToEmit) {
    final cachedState = state;
    emit(stateToEmit);
    emit(cachedState);
  }
}
