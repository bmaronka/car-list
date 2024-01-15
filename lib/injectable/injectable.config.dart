// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:car_connect/data/car/data_source/car_data_source.dart' as _i15;
import 'package:car_connect/data/car/service/car_service_impl.dart' as _i17;
import 'package:car_connect/data/db_client/database_client_impl.dart' as _i5;
import 'package:car_connect/data/locale/data_source/locale_db_data_source.dart'
    as _i6;
import 'package:car_connect/data/locale/service/locale_service_impl.dart'
    as _i8;
import 'package:car_connect/data/person/data_source/person_data_source.dart'
    as _i10;
import 'package:car_connect/data/person/service/person_service_impl.dart'
    as _i12;
import 'package:car_connect/domain/car/service/car_service.dart' as _i16;
import 'package:car_connect/domain/db_client/database_client.dart' as _i4;
import 'package:car_connect/domain/locale/service/locale_service.dart' as _i7;
import 'package:car_connect/domain/person/service/person_service.dart' as _i11;
import 'package:car_connect/domain/use_case/car/add_car_use_case.dart' as _i22;
import 'package:car_connect/domain/use_case/car/get_car_list_use_case.dart'
    as _i20;
import 'package:car_connect/domain/use_case/locale/get_locale_use_case.dart'
    as _i21;
import 'package:car_connect/domain/use_case/locale/notify_locale_changed_stream_use_case.dart'
    as _i9;
import 'package:car_connect/domain/use_case/locale/save_locale_use_case.dart'
    as _i13;
import 'package:car_connect/domain/use_case/locale/subscribe_locale_changed_stream_use_case.dart'
    as _i14;
import 'package:car_connect/domain/use_case/person/get_car_owner_use_case.dart'
    as _i18;
import 'package:car_connect/domain/use_case/person/get_car_owners_use_case.dart'
    as _i19;
import 'package:car_connect/injectable/dio_injectable/dio_configuration_module.dart'
    as _i27;
import 'package:car_connect/injectable/dio_injectable/dio_injectable.dart'
    as _i28;
import 'package:car_connect/presentation/screens/adding_car_page/cubit/adding_car_cubit.dart'
    as _i23;
import 'package:car_connect/presentation/screens/car_details_screen/cubit/car_details_cubit.dart'
    as _i25;
import 'package:car_connect/presentation/screens/car_list_screen/cubit/car_list_cubit.dart'
    as _i26;
import 'package:car_connect/presentation/widgets/car_connect_app_bar/cubit/car_connect_app_bar_cubit.dart'
    as _i24;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioConfigurationModule = _$DioConfigurationModule();
    final dioModule = _$DioModule();
    gh.singleton<_i3.BaseOptions>(dioConfigurationModule.createDioOptions());
    gh.factory<_i4.DatabaseClient>(() => const _i5.DatabaseClientImpl());
    gh.singleton<_i3.Dio>(dioModule.dio(gh<_i3.BaseOptions>()));
    gh.singleton<_i6.LocaleDbDataSource>(
        _i6.LocaleDbDataSource(gh<_i4.DatabaseClient>()));
    gh.lazySingleton<_i7.LocaleService>(
        () => _i8.LocaleServiceImpl(gh<_i6.LocaleDbDataSource>()));
    gh.factory<_i9.NotifyLocaleChangedStreamUseCase>(
        () => _i9.NotifyLocaleChangedStreamUseCase(gh<_i7.LocaleService>()));
    gh.factory<_i10.PersonDataSource>(
        () => _i10.PersonDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i11.PersonService>(
        () => _i12.PersonServiceImpl(gh<_i10.PersonDataSource>()));
    gh.factory<_i13.SaveLocaleUseCase>(
        () => _i13.SaveLocaleUseCase(gh<_i7.LocaleService>()));
    gh.factory<_i14.SubscribeLocaleChangedStreamUseCase>(() =>
        _i14.SubscribeLocaleChangedStreamUseCase(gh<_i7.LocaleService>()));
    gh.factory<_i15.CarDataSource>(() => _i15.CarDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i16.CarService>(
        () => _i17.CarServiceImpl(gh<_i15.CarDataSource>()));
    gh.factory<_i18.GerCarOwnerUseCase>(
        () => _i18.GerCarOwnerUseCase(gh<_i11.PersonService>()));
    gh.factory<_i19.GerCarOwnersUseCase>(
        () => _i19.GerCarOwnersUseCase(gh<_i11.PersonService>()));
    gh.factory<_i20.GetCarListUseCase>(
        () => _i20.GetCarListUseCase(gh<_i16.CarService>()));
    gh.factory<_i21.GetLocaleUseCase>(
        () => _i21.GetLocaleUseCase(gh<_i7.LocaleService>()));
    gh.factory<_i22.AddCarUseCase>(
        () => _i22.AddCarUseCase(gh<_i16.CarService>()));
    gh.factory<_i23.AddingCarCubit>(() => _i23.AddingCarCubit(
          gh<_i19.GerCarOwnersUseCase>(),
          gh<_i22.AddCarUseCase>(),
        ));
    gh.factory<_i24.CarConnectAppBarCubit>(() => _i24.CarConnectAppBarCubit(
          gh<_i13.SaveLocaleUseCase>(),
          gh<_i21.GetLocaleUseCase>(),
          gh<_i9.NotifyLocaleChangedStreamUseCase>(),
          gh<_i14.SubscribeLocaleChangedStreamUseCase>(),
        ));
    gh.factory<_i25.CarDetailsCubit>(
        () => _i25.CarDetailsCubit(gh<_i18.GerCarOwnerUseCase>()));
    gh.factory<_i26.CarListCubit>(
        () => _i26.CarListCubit(gh<_i20.GetCarListUseCase>()));
    return this;
  }
}

class _$DioConfigurationModule extends _i27.DioConfigurationModule {}

class _$DioModule extends _i28.DioModule {}
