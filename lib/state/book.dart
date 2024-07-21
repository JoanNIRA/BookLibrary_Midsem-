import 'package:flutter/material.dart';
import '../models/book.dart';

class BookState extends ChangeNotifier {


  List<BookModel> _books = []; // Initially empty list of books

  String _searchQuery = '';
  String _sortOrder = 'title'; // Default sort order

  List<BookModel> get books {
    List<BookModel> sortedBooks = [..._books];

    if (_sortOrder == 'title') {
      sortedBooks.sort((a, b) => a.title.compareTo(b.title));
    } else if (_sortOrder == 'author') {
      sortedBooks.sort((a, b) => a.author.compareTo(b.author));
    }


    if (_searchQuery.isEmpty) {
      return sortedBooks;
    } else {
      return sortedBooks.where((book) {
        final lowerQuery = _searchQuery.toLowerCase();
        return book.title.toLowerCase().contains(lowerQuery) ||
            book.author.toLowerCase().contains(lowerQuery);
      }).toList();
    }
  }

  String get sortOrder => _sortOrder;

  void setSortOrder(String sortOrder) {
    _sortOrder = sortOrder;
    notifyListeners();
  }

  void addBook(BookModel book) {
    _books.add(book);
    notifyListeners();
  }

  void editBook(BookModel updatedBook) {
    int index = _books.indexWhere((book) => book.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
      notifyListeners();
    }
  }

  void deleteBook(int id) {
    _books.removeWhere((book) => book.id == id);
    notifyListeners();
  }

  void rateBook(int id, int rating) {
    int index = _books.indexWhere((book) => book.id == id);
    if (index != -1) {
      _books[index] = _books[index].copyWith(rating: rating);
      notifyListeners();
    }
  }

  void markAsRead(int id, bool isRead) {
    int index = _books.indexWhere((book) => book.id == id);
    if (index != -1) {
      _books[index] = _books[index].copyWith(isRead: isRead);
      notifyListeners();
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void sortBooksByRating() {
    _books.sort((a, b) => b.rating.compareTo(a.rating));
    notifyListeners();
  }
}
