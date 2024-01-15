import 'package:auto_route/auto_route.dart';
import 'package:fimber_io/fimber_io.dart';

extension PopUntilWithResult on StackRouter {
  Future<void> popUntilWithResult<T>(String name, T result) async {
    if (stack.length < 2) {
      Fimber.e('Trying to pop first item in AutoRoute stack');
      return;
    }

    final previousRoutePageIndex = stack.length - 2;
    final previousRoutePage = stack[previousRoutePageIndex];

    final String routeName = previousRoutePage.routeData.name;

    if (routeName != name) {
      await pop();
      await popUntilWithResult(name, result);
    } else {
      await pop(result);
    }
  }
}
