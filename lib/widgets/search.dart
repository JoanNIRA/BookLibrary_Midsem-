import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../state/book.dart';
import '../widgets/book_card.dart';

class BookSearch extends SearchDelegate<BookModel> {
  final BookState bookState;

  BookSearch(this.bookState);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          bookState.updateSearchQuery(query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, BookModel(id: 0, title: '', author: '', rating: 0, isRead: false));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    bookState.updateSearchQuery(query);
    return Consumer<BookState>(
      builder: (context, state, child) {
        return ListView.builder(
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return BkCrd(book: state.books[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bookState.updateSearchQuery(query);
    return Consumer<BookState>(
      builder: (context, state, child) {
        return ListView.builder(
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return BkCrd(book: state.books[index]);
          },
        );
      },
    );
  }
}
