import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleLogic {
  final Locale _defaultLocal = const Locale('en');
  AppLocalizations? _strings;
  ValueNotifier<String> currentLocale = ValueNotifier('en');

  AppLocalizations get strings => _strings!;

  bool get isLoaded => _strings != null;

  bool get isEnglish => strings.localeName == 'en';

  Future<void> load() async {
    Locale locale = _defaultLocal;
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = _defaultLocal;
    }

    currentLocale.value = locale.languageCode;
    _strings = await AppLocalizations.delegate.load(locale);
  }

  Future<void> toggleLocale() async {
    final newLocale = Locale(isEnglish ? 'zh' : 'en');
    await loadIfChanged(newLocale);
  }

  Future<void> loadIfChanged(Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      _strings = await AppLocalizations.delegate.load(locale);
      currentLocale.value = locale.languageCode;
    }
  }
}
