import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/domain/car/service/car_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCarUseCase {
  final CarService _carService;

  const AddCarUseCase(this._carService);

  Future<void> call(Car car) => _carService.addCar(car);
}
