import 'package:flutter/material.dart';
import 'package:test_flutter_dev/app_colors.dart';
import 'package:test_flutter_dev/auto_route.gr.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        errorColor: AppColors.errorColor,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.buttonPrimaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.appBarBackgroundColor,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: AppColors.appBarTitleColor,
            ),
          ),
        ),
      ),
      title: 'Booking App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
