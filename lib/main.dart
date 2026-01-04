import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/providers/app_Language_Provider.dart';
import 'package:news_app/providers/app_Theme_Provider.dart';
import 'package:news_app/ui/home/home_Screen.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';

import 'di/di_inject.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  //configureDependencies();
  runApp(
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
            ChangeNotifierProvider(create: (context) => AppThemeProvider(),)
          ],
      child: news_app()));
}

class news_app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName : (context)=> HomeScreen(),
      },
      theme:AppTheme.lightTheme ,
      darkTheme:AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      locale : Locale(languageProvider.appLanguage)
    );
  }
}