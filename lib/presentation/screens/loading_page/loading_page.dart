import 'package:car_list/presentation/widgets/car_connect_app_bar/car_connect_app_bar.dart';
import 'package:car_list/presentation/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: CarConnectAppBar(title: ''),
        body: CarConnectLoader(),
      );
}
