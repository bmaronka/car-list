import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/extensions/extension_mixin.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:car_list/presentation/screens/adding_car_page/cubit/adding_car_cubit.dart';
import 'package:car_list/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CarDetails extends HookWidget {
  const CarDetails({
    required this.cubit,
    required this.car,
    required this.canProcced,
    super.key,
  });

  final AddingCarCubit cubit;
  final Car car;
  final bool canProcced;

  @override
  Widget build(BuildContext context) {
    final brandController = useTextEditingController(text: car.brand);
    final modelController = useTextEditingController(text: car.model);
    final registrationController = useTextEditingController(text: car.registration);
    final yearOfProductionController = useTextEditingController(text: car.yearString);
    final colorController = useTextEditingController(text: car.colorString);
    final locationController = useTextEditingController(text: car.locationString);

    useEffect(
      () {
        if (car.yearString != null) {
          yearOfProductionController.text = car.yearString!;
        }

        colorController.text = car.colorString;

        if (car.locationString != null) {
          locationController.text = car.locationString!;
        }

        return null;
      },
      [car.yearString, car.colorString, car.locationString],
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            Strings.of(context).addCarDetails,
            style: TextStyle(fontSize: Dimens.ms),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: brandController,
            decoration: InputDecoration(
              hintText: Strings.of(context).brand,
            ),
            onChanged: cubit.onBrandChange,
          ),
          TextField(
            controller: modelController,
            decoration: InputDecoration(
              hintText: Strings.of(context).model,
            ),
            onChanged: cubit.onModelChange,
          ),
          TextField(
            controller: registrationController,
            decoration: InputDecoration(
              hintText: Strings.of(context).registration,
            ),
            onChanged: cubit.onRegistrationChange,
          ),
          TextField(
            controller: yearOfProductionController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: Strings.of(context).yearOfProduction,
            ),
            onTap: cubit.showYearPicker,
          ),
          TextField(
            controller: colorController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: Strings.of(context).color,
              prefixIcon: Icon(
                Icons.circle,
                color: car.color,
              ),
            ),
            onTap: cubit.showColorPicker,
          ),
          TextField(
            controller: locationController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: Strings.of(context).carLocation,
            ),
            onTap: cubit.showLocationPicker,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: cubit.backFromCarDetails,
                child: Text(Strings.of(context).back),
              ),
              SizedBox(width: Dimens.m),
              IgnorePointer(
                ignoring: !canProcced,
                child: ElevatedButton(
                  onPressed: canProcced ? cubit.addCar : null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: context.getColors().primary.withOpacity(.5),
                    disabledForegroundColor: Colors.white,
                  ),
                  child: Text(Strings.of(context).forward),
                ),
              ),
            ],
          ),
        ].insertBetweenElements(() => SizedBox(height: Dimens.m)),
      ),
    );
  }
}
