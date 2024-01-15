import 'package:car_connect/domain/car/model/car.dart';

abstract class CarService {
  Future<List<Car>> getCarList();

  Future<void> addCar(Car car);
}
