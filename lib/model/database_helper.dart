// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:grad_project/class_helper.dart';
//
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//
//   factory DatabaseHelper() => _instance;
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   DatabaseHelper._internal();
//
//   Future<Database> _initDatabase() async {
//     String databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'my_database.db');
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDatabase,
//     );
//   }
//
//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS users (
//         userId INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         password TEXT,
//         email TEXT,
//         phone TEXT,
//         gender TEXT,
//         birthday TEXT
//       )
//     ''');
//   }
//
//
// }
