import 'package:auto_route/auto_route.dart';
import 'package:car_connect/data/model/offline_error.dart';
import 'package:car_connect/generated/l10n.dart';
import 'package:car_connect/presentation/routing/router.gr.dart';
import 'package:car_connect/presentation/widgets/car_connect_app_bar/car_connect_app_bar.dart';
import 'package:car_connect/presentation/widgets/message_body/message_body.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? title;
  final Object error;
  final VoidCallback? onConfirm;

  const ErrorPage(
    this.error, {
    this.title,
    this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CarConnectAppBar(title: getTitle(context)),
        body: MessageBody.error(
          title: getTitle(context),
          onConfirm: onConfirm ?? () => context.router.popUntilRouteWithName(CarListRoute.name),
          confirmButtonTitle: Strings.of(context).reload,
        ),
      );

  String getTitle(BuildContext context) => error.isOfflineError
      ? title ?? Strings.of(context).offlineErrorTitle
      : title ?? Strings.of(context).unspecifiedErrorTitle;
}
