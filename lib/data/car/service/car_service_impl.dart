import 'package:car_connect/constants/car_list.dart';
import 'package:car_connect/data/car/data_source/car_data_source.dart';
import 'package:car_connect/data/car/model/car_dto.dart';
import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/domain/car/service/car_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarService)
class CarServiceImpl implements CarService {
  final CarDataSource _carDataSource;

  const CarServiceImpl(
    this._carDataSource,
  );

  @override
  Future<List<Car>> getCarList() async => carList.map(Car.fromCarDto).toList();
  // {
  // final carList = await _carDataSource.getCarList();
  // return carList.map(Car.fromCarDto).toList(growable: false);
  // }

  @override
  Future<void> addCar(Car car) async => carList.add(CarDto.fromCar(car));
  // _carDataSource.addCar(CarDto.fromCar(car));
}
