import 'package:car_list/domain/db_client/database_client_initializer.dart';
import 'package:car_list/injectable/injectable.dart';
import 'package:car_list/mobile_app.dart';
import 'package:car_list/presentation/routing/router.dart';
import 'package:car_list/utils/logging_bloc_observer.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() => run();

Future<void> run() async {
  await initializeApp();

  runApp(App(MainRouter()));
}

@visibleForTesting
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  Fimber.plantTree(DebugTree());

  configureDependencies();
  await DatabaseClientInitializer.create();

  Bloc.observer = LoggingBlocObserver();
}
