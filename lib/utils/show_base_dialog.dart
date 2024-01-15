import 'package:flutter/material.dart';

Future<T?> showBaseDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  bool useRootNavigator = false,
}) =>
    showDialog(
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => child,
    );
