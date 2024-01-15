import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/domain/car/service/car_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCarListUseCase {
  final CarService _carService;

  const GetCarListUseCase(this._carService);

  Future<List<Car>> call() => _carService.getCarList();
}
