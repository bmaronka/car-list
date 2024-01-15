import 'package:auto_route/auto_route.dart';
import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/presentation/routing/router.gr.dart';
import 'package:car_list/style/dimens.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  const CarTile({
    required this.car,
    super.key,
  });

  final Car car;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 3,
        child: ListTile(
          tileColor: car.tintColor,
          leading: Container(
            height: double.infinity,
            width: Dimens.l,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: car.color,
            ),
          ),
          title: Text(car.displayName),
          subtitle: car.yearString != null ? Text(car.yearString!) : null,
          trailing: Text(car.registration),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          onTap: () => _navigateToDetails(context),
        ),
      );

  void _navigateToDetails(BuildContext context) => context.router.push(CarDetailsRoute(car: car));
}
