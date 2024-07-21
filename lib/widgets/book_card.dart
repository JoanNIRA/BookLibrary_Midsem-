import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/screens/book_details.dart';
import '../models/book.dart';
import '../state/book.dart';


class BkCrd extends StatelessWidget {
  final BookModel book;

  BkCrd({required this.book});

  @override
  Widget build(BuildContext context) {
    final bookState = Provider.of<BookState>(context);

    return Card(
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
        trailing: Checkbox(
          value: book.isRead,
          onChanged: (bool? value) {
            if (value != null) {
              bookState.markAsRead(book.id, value);
            }
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailScreen(book: book),
            ),
          );
        },
      ),
    );
  }
}
