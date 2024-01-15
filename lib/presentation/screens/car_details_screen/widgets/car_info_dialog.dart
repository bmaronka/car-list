import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:car_connect/style/dimens.dart';
import 'package:flutter/material.dart';

class CarInfoDialog extends StatelessWidget {
  const CarInfoDialog({
    required this.car,
    super.key,
  });

  final Car car;

  @override
  Widget build(BuildContext context) => Center(
        child: Material(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(car.displayName),
                Text(car.registration),
                if (car.yearString != null) Text(car.yearString!),
                Container(
                  height: Dimens.l,
                  width: Dimens.l,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: car.color,
                  ),
                ),
              ].insertBetweenElements(() => SizedBox(height: Dimens.m)),
            ),
          ),
        ),
      );
}
