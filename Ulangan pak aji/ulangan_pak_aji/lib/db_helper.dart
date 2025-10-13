import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todo(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            category TEXT,
            isDone INTEGER,
            dueDate TEXT
          )
        ''');
      },
    );
  }

  // Insert Data
  Future<int> insertTodo(Map<String, dynamic> data) async {
    final client = await db;
    return await client.insert('todo', data);
  }

  // Tandai Todo sebagai Selesai
  Future<int> markAsDone(int id) async {
    final client = await db;
    // Perbarui kolom 'isDone' menjadi 1 (true)
    return await client.update(
      'todo',
      {'isDone': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Dapatkan Semua Todo yang Belum Selesai (isDone = 0)
  Future<List<Map<String, dynamic>>> getPendingTodos() async {
    final client = await db;
    // Ambil data di mana isDone bernilai 0
    return await client.query(
      'todo',
      where: 'isDone = ?',
      whereArgs: [0],
      orderBy:
          'dueDate ASC', // Urutkan berdasarkan tanggal jatuh tempo atau sesuai keinginan
    );
  }

  // Dapatkan Semua Todo yang Sudah Selesai (isDone = 1)
  Future<List<Map<String, dynamic>>> getCompletedTodos() async {
    final client = await db;
    // Ambil data di mana isDone bernilai 1
    return await client.query(
      'todo',
      where: 'isDone = ?',
      whereArgs: [1],
      orderBy: 'id DESC', // Urutkan dari yang terbaru diselesaikan
    );
  }

  // Get All Todos
  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = await db;
    return await client.query('todo', orderBy: 'id DESC');
  }

  // Update Todo
  Future<int> updateTodo(int id, Map<String, dynamic> data) async {
    final client = await db;
    return await client.update('todo', data, where: 'id = ?', whereArgs: [id]);
  }

  // Delete Todo
  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  // Clear All
  Future<void> clearAll() async {
    final client = await db;
    await client.delete('todo');
  }
}
