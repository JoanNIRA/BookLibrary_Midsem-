import 'package:flutter/material.dart';
import '../database_provider.dart';
import '../models/book.dart';
import '../preferences.dart';

class BkSt extends ChangeNotifier {
  List<BookModel> _books = [];
  List<BookModel> get books => _books;

  String _sortOrder = 'title'; // Default sort order
  String get sortOrder => _sortOrder;

  BkSt() {
    loadSortOrder();
    loadBooks();
  }

  Future<void> loadSortOrder() async {
    _sortOrder = await UsrPrefs.getSortOrder();
    sortBooks();
    notifyListeners();
  }

  Future<void> loadBooks() async {
    _books = await DbProv().getBooks();
    sortBooks();
    notifyListeners();
  }

  void addBook(BookModel book) async {
    await DbProv().insertBook(book);
    loadBooks();
  }

  void editBook(BookModel book) async {
    await DbProv().updateBook(book);
    loadBooks();
  }

  void deleteBook(int id) async {
    await DbProv().deleteBook(id);
    loadBooks();
  }

  void setSortOrder(String order) {
    _sortOrder = order;
    sortBooks();
    notifyListeners();
  }

  void sortBooks() {
    switch (_sortOrder) {
      case 'author':
        _books.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'rating':
        _books.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'title':
      default:
        _books.sort((a, b) => a.title.compareTo(b.title));
    }
  }
}
