//======= PACKAGE IMPORTS =======//
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//======= PROJECT IMPORTS =======//
import '/utils/export_utils.dart';
import '../model/user_model.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._internal();
  factory UserDatabaseHelper() => instance;
  UserDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DatabaseConst.userDatabase);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS ${TablesConst.user} (
    ${UsersConst.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${UsersConst.name} TEXT,
    ${UsersConst.emailAddress} TEXT,
    ${UsersConst.phoneNo} TEXT,
    ${UsersConst.profileImage} TEXT
  )
''');
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }

  Future<void> insertUserData(UserResponse userData) async {
    final db = await UserDatabaseHelper().database;
    await db.insert(TablesConst.user, userData.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateUserData(int id, UserResponse userData) async {
    final db = await UserDatabaseHelper().database;
    return await db.update(
      TablesConst.user,
      userData.toJson(),
      where: '${UsersConst.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteUserData(int id) async {
    final db = await UserDatabaseHelper().database;
    return await db.delete(
      TablesConst.user,
      where: '${UsersConst.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<UserResponse>> getAllUserData() async {
    final db = await database;
    final result = await db.query(TablesConst.user, orderBy: '${UsersConst.id} ASC');
    return result.map((json) => UserResponse.fromJson(json)).toList();
  }
}
