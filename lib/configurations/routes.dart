import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/add_edit.dart';
import '../screens/book_details.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => HomeScreen(),
    '/add_edit': (context) {
      final BookModel? book = ModalRoute.of(context)?.settings.arguments as BookModel?;
      return AddEditScreen(book: book);
    },
    '/detail': (context) {
      final BookModel? book = ModalRoute.of(context)?.settings.arguments as BookModel?;
      return BookDetailScreen(book: book!);
    },
    '/settings': (context) => SettingsScreen(),
  };
}