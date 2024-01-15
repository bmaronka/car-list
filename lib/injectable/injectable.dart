import 'package:car_list/injectable/dio_injectable/dio_injectable.dart';
import 'package:car_list/injectable/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
  registerInterceptors();
}
