import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:threebody/src/logic/app_logic.dart';
import 'package:threebody/src/logic/locale_logic.dart';
import 'package:threebody/src/three_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  registerSingletons();

  runApp(const ThreeBody());

  appLogic.bootstrap();
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
}

LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();
AppLogic get appLogic => GetIt.I.get<AppLogic>();
AppLocalizations get $strings => localeLogic.strings;
