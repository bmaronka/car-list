import 'package:auto_route/auto_route.dart';
import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:car_connect/generated/l10n.dart';
import 'package:car_connect/presentation/routing/router.gr.dart';
import 'package:car_connect/presentation/screens/adding_car_page/body/car_details.dart';
import 'package:car_connect/presentation/screens/adding_car_page/body/owner_list.dart';
import 'package:car_connect/presentation/screens/adding_car_page/cubit/adding_car_cubit.dart';
import 'package:car_connect/presentation/screens/error_page/error_page.dart';
import 'package:car_connect/presentation/widgets/car_connect_app_bar/car_connect_app_bar.dart';
import 'package:car_connect/presentation/widgets/loader/loader.dart';
import 'package:car_connect/style/dimens.dart';
import 'package:car_connect/utils/or_else_handlers.dart';
import 'package:car_connect/utils/show_base_dialog.dart';
import 'package:car_connect/utils/use_once.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

final _cracowLocation = GeoPoint(latitude: 50.063674, longitude: 19.940311);

@RoutePage()
class AddingCarScreen extends HookWidget {
  const AddingCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<AddingCarCubit>();
    final state = useBlocBuilder(
      cubit,
      buildWhen: _buildWhen,
    );
    useBlocListener(
      cubit,
      _listener,
      listenWhen: _listenWhen,
    );
    useOnce(cubit.init);

    return Scaffold(
      appBar: CarConnectAppBar(title: Strings.of(context).addingCarScreenTitle),
      body: Padding(
        padding: EdgeInsets.all(Dimens.m),
        child: state.maybeWhen(
          loading: CarConnectLoader.new,
          ownerList: (owners) => OwnerList(
            cubit: cubit,
            owners: owners,
          ),
          carDetails: (car, canProcced) => CarDetails(
            cubit: cubit,
            car: car,
            canProcced: canProcced,
          ),
          error: (error) => ErrorPage(
            error,
            onConfirm: cubit.init,
          ),
          orElse: buildNothing,
        ),
      ),
    );
  }

  bool _buildWhen(AddingCarState state) => state is AddingCarStateBuilder;

  bool _listenWhen(AddingCarState state) => state is AddingCarStateListener;

  void _listener(AddingCarCubit cubit, AddingCarState state, BuildContext context) => state.maybeWhen(
        showErrorSnackBar: context.showErrorSnackBar,
        showYearPicker: (selectedYear) => _showYearPicker(context, cubit, selectedYear),
        showColorPicker: (selectedColor) => _showColorPicker(context, cubit, selectedColor),
        showLocationPicker: (geoPoint) => _showLocationPicker(context, cubit, geoPoint),
        navigateToCarList: (newCar) => context.router.popUntilWithResult(CarListRoute.name, newCar),
        orElse: doNothing,
      );

  Future<void> _showYearPicker(BuildContext context, AddingCarCubit cubit, DateTime selectedYear) async {
    final year = await showBaseDialog<DateTime>(
      context: context,
      child: Center(
        child: Material(
          elevation: 3,
          child: SizedBox(
            height: 300,
            width: 300,
            child: YearPicker(
              firstDate: DateTime(1950),
              lastDate: DateTime(2023),
              selectedDate: selectedYear,
              currentDate: selectedYear,
              onChanged: context.router.pop,
            ),
          ),
        ),
      ),
    );

    if (year != null) {
      cubit.pickYear(year);
    }
  }

  void _showColorPicker(BuildContext context, AddingCarCubit cubit, Color selectedColor) => showBaseDialog<Color>(
        context: context,
        child: Center(
          child: Material(
            elevation: 3,
            child: SizedBox(
              height: 500,
              width: 300,
              child: ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: cubit.pickColor,
              ),
            ),
          ),
        ),
      );

  Future<void> _showLocationPicker(BuildContext context, AddingCarCubit cubit, GeoPoint? geoPoint) async {
    final pickedLocation = await showSimplePickerLocation(
      context: context,
      initPosition: geoPoint ?? _cracowLocation,
      textCancelPicker: Strings.of(context).cancel,
      textConfirmPicker: Strings.of(context).pick,
      zoomOption: const ZoomOption(
        initZoom: 17,
        maxZoomLevel: 17,
        minZoomLevel: 4,
      ),
    );

    if (pickedLocation != null) {
      cubit.pickLocation(pickedLocation);
    }
  }
}
