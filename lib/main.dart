import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/state/app.dart';
import 'package:your_project_name/state/book.dart';
import 'Utils/constants.dart';
import 'configurations/routes.dart';
import 'configurations/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSt()),
        ChangeNotifierProvider(create: (_) => BkSt()),
      ],
      child: Consumer<AppSt>(
        builder: (context, appState, child) {
          return MaterialApp(
            title: Constants.appName,
            theme: appState.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
            routes: AppRoutes.routes,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
