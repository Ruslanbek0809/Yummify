import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'shared/shared.dart';
import 'widgets/widgets.dart';

class YummifyApp extends StatelessWidget {
  const YummifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Orientation: PORTRAIT Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      // designSize: const Size(428, 926),
      splitScreenMode: true,
      minTextAdapt:
          true, // Whether to adapt the text according to the minimum of width and height
      useInheritedMediaQuery: true,
      builder: (context, widget) => MaterialApp(
        useInheritedMediaQuery: true,
        title: Constants.appName,
        navigatorObservers: [StackedService.routeObserver],
        navigatorKey: StackedService.navigatorKey, // For stacked_services
        onGenerateRoute: StackedRouter()
            .onGenerateRoute, // Auto generates all routes using stacked package
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: kcFontColor,
          scaffoldBackgroundColor: kcBackgroundColor,
          splashColor: kcBackgroundColor,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: kcFontColor,
          scaffoldBackgroundColor: kcBackgroundColor,
          splashColor: kcBackgroundColor,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(), // To remove the glow effect entirely
            child: MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
