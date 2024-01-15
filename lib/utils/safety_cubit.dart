import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CarConnectCubit<State> extends BlocBase<State> {
  CarConnectCubit(State state) : super(state);

  @override
  void emit(State state) {
    if (isClosed) {
      return;
    } else {
      super.emit(state);
    }
  }
}
