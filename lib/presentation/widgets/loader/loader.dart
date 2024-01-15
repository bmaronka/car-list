import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:flutter/cupertino.dart';

const _defaultLoaderRadius = 10.0;

class CarConnectLoader extends StatelessWidget {
  final Color? color;
  final double? radius;

  const CarConnectLoader({
    this.color,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: CupertinoActivityIndicator(
          color: color ?? context.getColors().primary,
          radius: radius ?? _defaultLoaderRadius,
        ),
      );
}
