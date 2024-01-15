import 'package:auto_route/auto_route.dart';
import 'package:car_list/presentation/routing/router.gr.dart';

@AutoRouterConfig()
class MainRouter extends $MainRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CarListRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: CarDetailsRoute.page,
        ),
        AutoRoute(
          page: AddingCarRoute.page,
        ),
      ];
}
