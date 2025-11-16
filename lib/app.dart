import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module_12_assignment/calculator.dart';
import 'package:module_12_assignment/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return MaterialApp(
          title: "Module-12 | Calculator",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,

          home: Calculator(
            onToggleTheme: toggleTheme,
            isDarkMode: themeMode == ThemeMode.dark,
          ),
          /*
      initialRoute: 'calculator',
      routes: {
        'calculator': (context) => Calculator(
          onToggleTheme: toggleTheme,
          isDarkMode: themeMode == ThemeMode.dark,
        ),
      },
      */
        );
      },
    );

  }
}
