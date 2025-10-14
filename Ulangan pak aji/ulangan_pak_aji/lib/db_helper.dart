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

  //add
  Future<int> insertTodo(Map<String, dynamic> data) async {
    final client = await db;
    return await client.insert('todo', data);
  }

  //finish
  Future<int> markAsDone(int id) async {
    final client = await db;
    return await client.update(
      'todo',
      {'isDone': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Get pending todos
  Future<List<Map<String, dynamic>>> getPendingTodos() async {
    final client = await db;
    return await client.query(
      'todo',
      where: 'isDone = ?',
      whereArgs: [0],
      orderBy: 'dueDate ASC',
    );
  }

  // Get completed todos
  Future<List<Map<String, dynamic>>> getCompletedTodos() async {
    final client = await db;
    return await client.query(
      'todo',
      where: 'isDone = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
    );
  }

  //get data
  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = await db;
    return await client.query('todo', orderBy: 'id DESC');
  }

  //Update
  Future<int> updateTodo(int id, Map<String, dynamic> data) async {
    final client = await db;
    return await client.update('todo', data, where: 'id = ?', whereArgs: [id]);
  }

  //Delete
  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete('todo', where: 'id = ?', whereArgs: [id]);
  }
}
