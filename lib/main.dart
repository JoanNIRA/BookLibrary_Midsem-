import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/app.dart';
import 'state/book.dart';
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
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => BookState()),
      ],
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return MaterialApp(
            title: 'My Book Library',
            theme: appState.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
            routes: AppRoutes.routes,
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}