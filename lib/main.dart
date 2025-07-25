import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme/my_theme_data.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    loadSharedPrefsData(provider);

    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => HadethDetailsScreen(),

      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightMode,
      themeMode: provider.appMode,
      darkTheme: MyTheme.darkMode,
      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      locale: Locale(provider.appLanguage),
    );
  }

  Future<void> loadSharedPrefsData(AppConfigProvider provider) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = prefs.getString("language");
    if(language != null){
      provider.changeAppLanguage(language);
    }
    var isDark = prefs.getBool("isDark");
    if(isDark == true){
      provider.changeAppMode(ThemeMode.dark);
    }else if(isDark == false){
      provider.changeAppMode(ThemeMode.light);
    }
  }
}