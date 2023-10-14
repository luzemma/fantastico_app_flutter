import 'package:fantastico_app/l10n/l10n.dart';
import 'package:fantastico_app/ui/router/app_router.dart';
import 'package:fantastico_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.light],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
