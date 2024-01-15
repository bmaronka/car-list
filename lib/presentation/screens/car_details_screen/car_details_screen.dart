import 'package:auto_route/auto_route.dart';
import 'package:car_connect/domain/car/model/car.dart';
import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:car_connect/presentation/screens/car_details_screen/body/car_details_body.dart';
import 'package:car_connect/presentation/screens/car_details_screen/cubit/car_details_cubit.dart';
import 'package:car_connect/presentation/screens/car_details_screen/widgets/car_info_dialog.dart';
import 'package:car_connect/presentation/screens/loading_page/loading_page.dart';
import 'package:car_connect/utils/or_else_handlers.dart';
import 'package:car_connect/utils/show_base_dialog.dart';
import 'package:car_connect/utils/use_once.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

@RoutePage()
class CarDetailsScreen extends HookWidget {
  const CarDetailsScreen({
    required this.car,
    super.key,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CarDetailsCubit>();
    final state = useBlocBuilder(
      cubit,
      buildWhen: _buildWhen,
    );
    useBlocListener(
      cubit,
      _listener,
      listenWhen: _listenWhen,
    );
    useOnce(() => cubit.init(car.ownerId));

    return state.maybeWhen(
      loading: LoadingPage.new,
      loaded: (owner) => CarDetailsBody(
        cubit: cubit,
        car: car,
        owner: owner,
      ),
      orElse: buildNothing,
    );
  }

  bool _buildWhen(CarDetailsState state) => state is CarDetailsStateBuilder;

  bool _listenWhen(CarDetailsState state) => state is CarDetailsStateListener;

  void _listener(_, CarDetailsState state, BuildContext context) => state.maybeWhen(
        showErrorSnackBar: context.showErrorSnackBar,
        showCarDetailsDialog: () => _showCarDetailsDialog(context),
        orElse: doNothing,
      );

  void _showCarDetailsDialog(BuildContext context) => showBaseDialog(
        context: context,
        child: CarInfoDialog(car: car),
      );
}
