// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_connect_app_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarConnectAppBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppLocale? locale) idle,
    required TResult Function(Object error) showErrorSnackBar,
    required TResult Function(AppLocale locale) switchLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppLocale? locale)? idle,
    TResult? Function(Object error)? showErrorSnackBar,
    TResult? Function(AppLocale locale)? switchLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppLocale? locale)? idle,
    TResult Function(Object error)? showErrorSnackBar,
    TResult Function(AppLocale locale)? switchLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CarConnectAppBarStateIdle value) idle,
    required TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)
        showErrorSnackBar,
    required TResult Function(_CarConnectAppBarStateSwitchLocale value)
        switchLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CarConnectAppBarStateIdle value)? idle,
    TResult? Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult? Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CarConnectAppBarStateIdle value)? idle,
    TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarConnectAppBarStateCopyWith<$Res> {
  factory $CarConnectAppBarStateCopyWith(CarConnectAppBarState value,
          $Res Function(CarConnectAppBarState) then) =
      _$CarConnectAppBarStateCopyWithImpl<$Res, CarConnectAppBarState>;
}

/// @nodoc
class _$CarConnectAppBarStateCopyWithImpl<$Res,
        $Val extends CarConnectAppBarState>
    implements $CarConnectAppBarStateCopyWith<$Res> {
  _$CarConnectAppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CarConnectAppBarStateIdleCopyWith<$Res> {
  factory _$$_CarConnectAppBarStateIdleCopyWith(
          _$_CarConnectAppBarStateIdle value,
          $Res Function(_$_CarConnectAppBarStateIdle) then) =
      __$$_CarConnectAppBarStateIdleCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLocale? locale});
}

/// @nodoc
class __$$_CarConnectAppBarStateIdleCopyWithImpl<$Res>
    extends _$CarConnectAppBarStateCopyWithImpl<$Res,
        _$_CarConnectAppBarStateIdle>
    implements _$$_CarConnectAppBarStateIdleCopyWith<$Res> {
  __$$_CarConnectAppBarStateIdleCopyWithImpl(
      _$_CarConnectAppBarStateIdle _value,
      $Res Function(_$_CarConnectAppBarStateIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$_CarConnectAppBarStateIdle(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale?,
    ));
  }
}

/// @nodoc

class _$_CarConnectAppBarStateIdle implements _CarConnectAppBarStateIdle {
  const _$_CarConnectAppBarStateIdle({required this.locale});

  @override
  final AppLocale? locale;

  @override
  String toString() {
    return 'CarConnectAppBarState.idle(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarConnectAppBarStateIdle &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarConnectAppBarStateIdleCopyWith<_$_CarConnectAppBarStateIdle>
      get copyWith => __$$_CarConnectAppBarStateIdleCopyWithImpl<
          _$_CarConnectAppBarStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppLocale? locale) idle,
    required TResult Function(Object error) showErrorSnackBar,
    required TResult Function(AppLocale locale) switchLocale,
  }) {
    return idle(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppLocale? locale)? idle,
    TResult? Function(Object error)? showErrorSnackBar,
    TResult? Function(AppLocale locale)? switchLocale,
  }) {
    return idle?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppLocale? locale)? idle,
    TResult Function(Object error)? showErrorSnackBar,
    TResult Function(AppLocale locale)? switchLocale,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CarConnectAppBarStateIdle value) idle,
    required TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)
        showErrorSnackBar,
    required TResult Function(_CarConnectAppBarStateSwitchLocale value)
        switchLocale,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CarConnectAppBarStateIdle value)? idle,
    TResult? Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult? Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CarConnectAppBarStateIdle value)? idle,
    TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _CarConnectAppBarStateIdle
    implements CarConnectAppBarState, CarConnectAppBarStateBuilder {
  const factory _CarConnectAppBarStateIdle({required final AppLocale? locale}) =
      _$_CarConnectAppBarStateIdle;

  AppLocale? get locale;
  @JsonKey(ignore: true)
  _$$_CarConnectAppBarStateIdleCopyWith<_$_CarConnectAppBarStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CarConnectAppBarStateShowErrorSnackBarCopyWith<$Res> {
  factory _$$_CarConnectAppBarStateShowErrorSnackBarCopyWith(
          _$_CarConnectAppBarStateShowErrorSnackBar value,
          $Res Function(_$_CarConnectAppBarStateShowErrorSnackBar) then) =
      __$$_CarConnectAppBarStateShowErrorSnackBarCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$_CarConnectAppBarStateShowErrorSnackBarCopyWithImpl<$Res>
    extends _$CarConnectAppBarStateCopyWithImpl<$Res,
        _$_CarConnectAppBarStateShowErrorSnackBar>
    implements _$$_CarConnectAppBarStateShowErrorSnackBarCopyWith<$Res> {
  __$$_CarConnectAppBarStateShowErrorSnackBarCopyWithImpl(
      _$_CarConnectAppBarStateShowErrorSnackBar _value,
      $Res Function(_$_CarConnectAppBarStateShowErrorSnackBar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_CarConnectAppBarStateShowErrorSnackBar(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_CarConnectAppBarStateShowErrorSnackBar
    implements _CarConnectAppBarStateShowErrorSnackBar {
  const _$_CarConnectAppBarStateShowErrorSnackBar(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'CarConnectAppBarState.showErrorSnackBar(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarConnectAppBarStateShowErrorSnackBar &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarConnectAppBarStateShowErrorSnackBarCopyWith<
          _$_CarConnectAppBarStateShowErrorSnackBar>
      get copyWith => __$$_CarConnectAppBarStateShowErrorSnackBarCopyWithImpl<
          _$_CarConnectAppBarStateShowErrorSnackBar>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppLocale? locale) idle,
    required TResult Function(Object error) showErrorSnackBar,
    required TResult Function(AppLocale locale) switchLocale,
  }) {
    return showErrorSnackBar(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppLocale? locale)? idle,
    TResult? Function(Object error)? showErrorSnackBar,
    TResult? Function(AppLocale locale)? switchLocale,
  }) {
    return showErrorSnackBar?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppLocale? locale)? idle,
    TResult Function(Object error)? showErrorSnackBar,
    TResult Function(AppLocale locale)? switchLocale,
    required TResult orElse(),
  }) {
    if (showErrorSnackBar != null) {
      return showErrorSnackBar(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CarConnectAppBarStateIdle value) idle,
    required TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)
        showErrorSnackBar,
    required TResult Function(_CarConnectAppBarStateSwitchLocale value)
        switchLocale,
  }) {
    return showErrorSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CarConnectAppBarStateIdle value)? idle,
    TResult? Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult? Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
  }) {
    return showErrorSnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CarConnectAppBarStateIdle value)? idle,
    TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
    required TResult orElse(),
  }) {
    if (showErrorSnackBar != null) {
      return showErrorSnackBar(this);
    }
    return orElse();
  }
}

abstract class _CarConnectAppBarStateShowErrorSnackBar
    implements CarConnectAppBarState, CarConnectAppBarStateListener {
  const factory _CarConnectAppBarStateShowErrorSnackBar(final Object error) =
      _$_CarConnectAppBarStateShowErrorSnackBar;

  Object get error;
  @JsonKey(ignore: true)
  _$$_CarConnectAppBarStateShowErrorSnackBarCopyWith<
          _$_CarConnectAppBarStateShowErrorSnackBar>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CarConnectAppBarStateSwitchLocaleCopyWith<$Res> {
  factory _$$_CarConnectAppBarStateSwitchLocaleCopyWith(
          _$_CarConnectAppBarStateSwitchLocale value,
          $Res Function(_$_CarConnectAppBarStateSwitchLocale) then) =
      __$$_CarConnectAppBarStateSwitchLocaleCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLocale locale});
}

/// @nodoc
class __$$_CarConnectAppBarStateSwitchLocaleCopyWithImpl<$Res>
    extends _$CarConnectAppBarStateCopyWithImpl<$Res,
        _$_CarConnectAppBarStateSwitchLocale>
    implements _$$_CarConnectAppBarStateSwitchLocaleCopyWith<$Res> {
  __$$_CarConnectAppBarStateSwitchLocaleCopyWithImpl(
      _$_CarConnectAppBarStateSwitchLocale _value,
      $Res Function(_$_CarConnectAppBarStateSwitchLocale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$_CarConnectAppBarStateSwitchLocale(
      null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$_CarConnectAppBarStateSwitchLocale
    implements _CarConnectAppBarStateSwitchLocale {
  const _$_CarConnectAppBarStateSwitchLocale(this.locale);

  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'CarConnectAppBarState.switchLocale(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarConnectAppBarStateSwitchLocale &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarConnectAppBarStateSwitchLocaleCopyWith<
          _$_CarConnectAppBarStateSwitchLocale>
      get copyWith => __$$_CarConnectAppBarStateSwitchLocaleCopyWithImpl<
          _$_CarConnectAppBarStateSwitchLocale>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppLocale? locale) idle,
    required TResult Function(Object error) showErrorSnackBar,
    required TResult Function(AppLocale locale) switchLocale,
  }) {
    return switchLocale(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppLocale? locale)? idle,
    TResult? Function(Object error)? showErrorSnackBar,
    TResult? Function(AppLocale locale)? switchLocale,
  }) {
    return switchLocale?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppLocale? locale)? idle,
    TResult Function(Object error)? showErrorSnackBar,
    TResult Function(AppLocale locale)? switchLocale,
    required TResult orElse(),
  }) {
    if (switchLocale != null) {
      return switchLocale(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CarConnectAppBarStateIdle value) idle,
    required TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)
        showErrorSnackBar,
    required TResult Function(_CarConnectAppBarStateSwitchLocale value)
        switchLocale,
  }) {
    return switchLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CarConnectAppBarStateIdle value)? idle,
    TResult? Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult? Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
  }) {
    return switchLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CarConnectAppBarStateIdle value)? idle,
    TResult Function(_CarConnectAppBarStateShowErrorSnackBar value)?
        showErrorSnackBar,
    TResult Function(_CarConnectAppBarStateSwitchLocale value)? switchLocale,
    required TResult orElse(),
  }) {
    if (switchLocale != null) {
      return switchLocale(this);
    }
    return orElse();
  }
}

abstract class _CarConnectAppBarStateSwitchLocale
    implements CarConnectAppBarState, CarConnectAppBarStateListener {
  const factory _CarConnectAppBarStateSwitchLocale(final AppLocale locale) =
      _$_CarConnectAppBarStateSwitchLocale;

  AppLocale get locale;
  @JsonKey(ignore: true)
  _$$_CarConnectAppBarStateSwitchLocaleCopyWith<
          _$_CarConnectAppBarStateSwitchLocale>
      get copyWith => throw _privateConstructorUsedError;
}
