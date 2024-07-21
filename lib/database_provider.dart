import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'booklibrary.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Books (
          id INTEGER PRIMARY KEY,
          title TEXT,
          author TEXT,
          rating INTEGER,
          isRead INTEGER
        )
      ''');
    });
  }

  Future<int> addBook(BookModel book) async {
    final db = await database;
    return await db.insert('Books', book.toMap());
  }

  Future<List<BookModel>> getBooks() async {
    final db = await database;
    var res = await db.query('Books');
    List<BookModel> list =
    res.isNotEmpty ? res.map((c) => BookModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> updateBook(BookModel book) async {
    final db = await database;
    return await db.update('Books', book.toMap(),
        where: 'id = ?', whereArgs: [book.id]);
  }

  Future<int> deleteBook(int id) async {
    final db = await database;
    return await db.delete('Books', where: 'id = ?', whereArgs: [id]);
  }
}
