import 'package:car_connect/data/model/offline_error.dart';
import 'package:car_connect/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ThemeProvider on BuildContext {
  ColorScheme getColors() => Theme.of(this).colorScheme;
}

extension AlertDisplayer on BuildContext {
  void showErrorSnackBar(Object error) => _showSnackBar(
        error.isOfflineError ? Strings.of(this).offlineErrorTitle : Strings.of(this).unspecifiedErrorTitle,
        getColors().error,
      );

  void showBottomSnackBar({required String title, Color? color}) => _showSnackBar(
        title,
        getColors().primary,
      );

  void _showSnackBar(String title, Color backgroundColor) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          content: Text(
            title,
          ),
        ),
      );
}
