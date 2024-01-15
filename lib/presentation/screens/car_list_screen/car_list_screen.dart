import 'package:auto_route/auto_route.dart';
import 'package:car_connect/extensions/extension_mixin.dart';
import 'package:car_connect/presentation/screens/car_list_screen/body/car_list_body.dart';
import 'package:car_connect/presentation/screens/car_list_screen/cubit/car_list_cubit.dart';
import 'package:car_connect/presentation/screens/error_page/error_page.dart';
import 'package:car_connect/presentation/screens/loading_page/loading_page.dart';
import 'package:car_connect/utils/or_else_handlers.dart';
import 'package:car_connect/utils/use_once.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

@RoutePage()
class CarListScreen extends HookWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CarListCubit>();
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

    return state.maybeWhen(
      loading: LoadingPage.new,
      loaded: (cars) => CarListBody(
        cubit: cubit,
        cars: cars,
      ),
      error: (error) => ErrorPage(
        error,
        onConfirm: cubit.init,
      ),
      orElse: buildNothing,
    );
  }

  bool _buildWhen(CarListState state) => state is CarListStateBuilder;

  bool _listenWhen(CarListState state) => state is CarListStateListener;

  void _listener(_, CarListState state, BuildContext context) => state.maybeWhen(
        showErrorSnackBar: context.showErrorSnackBar,
        orElse: doNothing,
      );
}
