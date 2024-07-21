import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences.dart';
import '../state/app.dart';
import '../state/book.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final bkState = Provider.of<BookState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: appState.isDarkMode,
              onChanged: (value) {
                appState.setTheme(value);
                UsrPrefs.setTheme(value);
              },
            ),
            ListTile(
              title: Text('Sort Order'),
              trailing: DropdownButton<String>(
                value: bkState.sortOrder,
                onChanged: (value) {
                  bkState.setSortOrder(value!);
                  UsrPrefs.setSortOrder(value);
                },
                items: ['title', 'author', 'rating'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}