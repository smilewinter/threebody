import 'package:flutter/material.dart';
import 'package:threebody/main.dart';
import 'package:threebody/src/route/app_router.dart';
import 'package:threebody/src/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThreeBody extends StatelessWidget {
  const ThreeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: localeLogic.currentLocale,
      builder: (context, locale, child) {
        return MaterialApp.router(
          title: 'Three Body',
          theme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(locale),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}

class CcXPage extends StatefulWidget {
  const CcXPage({super.key, required this.title});

  final String title;

  @override
  State<CcXPage> createState() => _CcXPageState();
}

class _CcXPageState extends State<CcXPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text($strings.appName),
        actions: [
          TextButton(
            onPressed: () {
              localeLogic.toggleLocale();
            },
            child: Text($strings.localeSwapButton),
          ),
        ],
      ),
      body: Center(
        child: Text($strings.more),
      ),
    );
  }
}
