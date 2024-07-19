import '../database_provider.dart';
import '../models/book.dart';


class BkRepo {
  final DbProv dbProvider = DbProv();

  Future<List<BookModel>> fetchBooks() async {
    return await dbProvider.getBooks();
  }

  Future<void> addBook(BookModel book) async {
    await dbProvider.insertBook(book);
  }

  Future<void> editBook(BookModel book) async {
    await dbProvider.updateBook(book);
  }

  Future<void> removeBook(int id) async {
    await dbProvider.deleteBook(id);
  }
}
