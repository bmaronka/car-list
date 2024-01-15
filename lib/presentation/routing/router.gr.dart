// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:car_connect/domain/car/model/car.dart' as _i5;
import 'package:car_connect/presentation/screens/adding_car_page/adding_car_screen.dart'
    as _i1;
import 'package:car_connect/presentation/screens/car_details_screen/car_details_screen.dart'
    as _i2;
import 'package:car_connect/presentation/screens/car_list_screen/car_list_screen.dart'
    as _i3;
import 'package:flutter/material.dart' as _i6;

abstract class $MainRouter extends _i4.RootStackRouter {
  $MainRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AddingCarRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddingCarScreen(),
      );
    },
    CarDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CarDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CarDetailsScreen(
          car: args.car,
          key: args.key,
        ),
      );
    },
    CarListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CarListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddingCarScreen]
class AddingCarRoute extends _i4.PageRouteInfo<void> {
  const AddingCarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddingCarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddingCarRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CarDetailsScreen]
class CarDetailsRoute extends _i4.PageRouteInfo<CarDetailsRouteArgs> {
  CarDetailsRoute({
    required _i5.Car car,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CarDetailsRoute.name,
          args: CarDetailsRouteArgs(
            car: car,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CarDetailsRoute';

  static const _i4.PageInfo<CarDetailsRouteArgs> page =
      _i4.PageInfo<CarDetailsRouteArgs>(name);
}

class CarDetailsRouteArgs {
  const CarDetailsRouteArgs({
    required this.car,
    this.key,
  });

  final _i5.Car car;

  final _i6.Key? key;

  @override
  String toString() {
    return 'CarDetailsRouteArgs{car: $car, key: $key}';
  }
}

/// generated route for
/// [_i3.CarListScreen]
class CarListRoute extends _i4.PageRouteInfo<void> {
  const CarListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CarListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CarListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
