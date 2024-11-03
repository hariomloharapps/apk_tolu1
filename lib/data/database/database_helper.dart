
// lib/data/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tolu_7/data/models/todo.dart';

class DatabaseHelper {
  static const _databaseName = "todo_app.db";
  static const _databaseVersion = 1;
  static const todoTable = 'todos';

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $todoTable (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        isCompleted INTEGER NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  // Database operations
  Future<int> insertTodo(Todo todo) async {
    Database db = await database;
    return await db.insert(todoTable, todo.toMap());
  }

  Future<List<Todo>> getAllTodos() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(todoTable,
        orderBy: 'createdAt DESC');

    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await database;
    return await db.update(
      todoTable,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(String id) async {
    Database db = await database;
    return await db.delete(
      todoTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllTodos() async {
    Database db = await database;
    await db.delete(todoTable);
  }
}
