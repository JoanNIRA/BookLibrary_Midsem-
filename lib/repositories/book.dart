import '../database_provider.dart';
import '../models/book.dart';

class BookRepository {
  final DatabaseProvider dbProvider = DatabaseProvider.db;

  Future<List<BookModel>> fetchBooks() async {
    return await dbProvider.getBooks();
  }

  Future<void> addBook(BookModel book) async {
    await dbProvider.addBook(book);
  }

  Future<void> editBook(BookModel book) async {
    await dbProvider.updateBook(book);
  }

  Future<void> removeBook(int id) async {
    await dbProvider.deleteBook(id);
  }
}
