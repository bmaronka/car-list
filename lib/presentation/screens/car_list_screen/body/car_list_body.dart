import 'package:auto_route/auto_route.dart';
import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/extensions/extension_mixin.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:car_list/presentation/routing/router.gr.dart';
import 'package:car_list/presentation/screens/car_list_screen/cubit/car_list_cubit.dart';
import 'package:car_list/presentation/screens/car_list_screen/widgets/car_tile.dart';
import 'package:car_list/presentation/widgets/car_connect_app_bar/car_connect_app_bar.dart';
import 'package:car_list/style/dimens.dart';
import 'package:flutter/material.dart';

class CarListBody extends StatelessWidget {
  const CarListBody({
    required this.cubit,
    required this.cars,
    super.key,
  });

  final CarListCubit cubit;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CarConnectAppBar(title: Strings.of(context).carListScreenTitle),
        body: Padding(
          padding: EdgeInsets.all(Dimens.m),
          child: Column(
            children: [
              Text(
                Strings.of(context).carListScreenDescription,
                style: TextStyle(fontSize: Dimens.ms),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: cars.length,
                  separatorBuilder: (context, index) => SizedBox(height: Dimens.xm),
                  itemBuilder: (context, index) => CarTile(car: cars[index]),
                ),
              ),
              SizedBox(height: Dimens.c),
            ].insertBetweenElements(() => SizedBox(height: Dimens.m)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addCar(context),
          child: const Icon(Icons.add),
        ),
      );

  Future<void> _addCar(BuildContext context) async {
    final newCar = await context.router.push(const AddingCarRoute());

    if (newCar != null) {
      await cubit.init();
    }
  }
}
