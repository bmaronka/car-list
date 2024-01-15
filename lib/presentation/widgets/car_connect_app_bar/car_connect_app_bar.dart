import 'package:car_list/extensions/extension_mixin.dart';
import 'package:car_list/presentation/widgets/car_connect_app_bar/cubit/car_connect_app_bar_cubit.dart';
import 'package:car_list/style/dimens.dart';
import 'package:car_list/style/locales.dart';
import 'package:car_list/utils/or_else_handlers.dart';
import 'package:car_list/utils/use_once.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:provider/provider.dart';

class CarConnectAppBar extends HookWidget implements PreferredSizeWidget {
  const CarConnectAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CarConnectAppBarCubit>();
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
      idle: (locale) => AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          if (locale != null)
            IconButton(
              onPressed: cubit.switchLocaleAndNotify,
              icon: SvgPicture.asset(
                locale.iconPath,
                height: Dimens.xm,
              ),
            ),
        ],
      ),
      orElse: buildNothing,
    );
  }

  bool _buildWhen(CarConnectAppBarState state) => state is CarConnectAppBarStateBuilder;

  bool _listenWhen(CarConnectAppBarState state) => state is CarConnectAppBarStateListener;

  void _listener(_, CarConnectAppBarState state, BuildContext context) => state.maybeWhen(
        showErrorSnackBar: context.showErrorSnackBar,
        switchLocale: (locale) => Provider.of<LocaleModel>(context, listen: false).setLocale = locale,
        orElse: doNothing,
      );
}
