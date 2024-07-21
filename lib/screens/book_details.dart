import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../state/book.dart';
import 'add_edit.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    final bookState = Provider.of<BookState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditScreen(book: book),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context, bookState, book.id);
            },
          ),
        ],
      ),
      backgroundColor: Colors.teal[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${book.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${book.author}',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: ${book.rating}',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              'Read: ${book.isRead ? 'Yes' : 'No'}',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            if (book.isRead)
              Icon(Icons.check_circle, color: Colors.green), // Visual indicator for read books
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, BookState bookState, int bookId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Book'),
          content: Text('Are you sure you want to delete this book?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                bookState.deleteBook(bookId);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
