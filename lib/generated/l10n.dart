// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Ups! Jesteś offline`
  String get offlineErrorTitle {
    return Intl.message(
      'Ups! Jesteś offline',
      name: 'offlineErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ups! Mamy problem`
  String get unspecifiedErrorTitle {
    return Intl.message(
      'Ups! Mamy problem',
      name: 'unspecifiedErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Zmiana języka`
  String get switchLocaleTest {
    return Intl.message(
      'Zmiana języka',
      name: 'switchLocaleTest',
      desc: '',
      args: [],
    );
  }

  /// `Odśwież`
  String get reload {
    return Intl.message(
      'Odśwież',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Lista Aut!`
  String get carListScreenTitle {
    return Intl.message(
      'Lista Aut!',
      name: 'carListScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Z tej listy możesz wybrać auto. Nie zwlekaj!`
  String get carListScreenDescription {
    return Intl.message(
      'Z tej listy możesz wybrać auto. Nie zwlekaj!',
      name: 'carListScreenDescription',
      desc: '',
      args: [],
    );
  }

  /// `Szczegóły Auta!`
  String get carDetailsScreenTitle {
    return Intl.message(
      'Szczegóły Auta!',
      name: 'carDetailsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Właściciel nieznany`
  String get ownerUnknown {
    return Intl.message(
      'Właściciel nieznany',
      name: 'ownerUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Mapa niedostępna`
  String get mapNotAvailable {
    return Intl.message(
      'Mapa niedostępna',
      name: 'mapNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Dodawanie Auta!`
  String get addingCarScreenTitle {
    return Intl.message(
      'Dodawanie Auta!',
      name: 'addingCarScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `M`
  String get maleLetter {
    return Intl.message(
      'M',
      name: 'maleLetter',
      desc: '',
      args: [],
    );
  }

  /// `K`
  String get femaleLetter {
    return Intl.message(
      'K',
      name: 'femaleLetter',
      desc: '',
      args: [],
    );
  }

  /// `Wybierz właściciela auta`
  String get pickOwner {
    return Intl.message(
      'Wybierz właściciela auta',
      name: 'pickOwner',
      desc: '',
      args: [],
    );
  }

  /// `Podaj szczegóły auta`
  String get addCarDetails {
    return Intl.message(
      'Podaj szczegóły auta',
      name: 'addCarDetails',
      desc: '',
      args: [],
    );
  }

  /// `Marka`
  String get brand {
    return Intl.message(
      'Marka',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Nr rejestracji`
  String get registration {
    return Intl.message(
      'Nr rejestracji',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Rok produkcji`
  String get yearOfProduction {
    return Intl.message(
      'Rok produkcji',
      name: 'yearOfProduction',
      desc: '',
      args: [],
    );
  }

  /// `Kolor`
  String get color {
    return Intl.message(
      'Kolor',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Wstecz`
  String get back {
    return Intl.message(
      'Wstecz',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Wyślij`
  String get forward {
    return Intl.message(
      'Wyślij',
      name: 'forward',
      desc: '',
      args: [],
    );
  }

  /// `Lokalizacja auta`
  String get carLocation {
    return Intl.message(
      'Lokalizacja auta',
      name: 'carLocation',
      desc: '',
      args: [],
    );
  }

  /// `Anuluj`
  String get cancel {
    return Intl.message(
      'Anuluj',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Wybierz`
  String get pick {
    return Intl.message(
      'Wybierz',
      name: 'pick',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
