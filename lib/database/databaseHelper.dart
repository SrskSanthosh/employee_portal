import 'package:employee_portal/models/employee_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "employee.db";
  static const _databaseVersion = 1;

  static const table = 'employee_table';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnUserName = 'username';
  static const columnEmail = 'email';
  static const columnProfileImage = 'profile_image';
  static const columnAddress = 'address';
  static const columnPhone = 'phone';
  static const columnWebsite = 'website';
  static const columnCompany = 'company';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER,
            $columnName TEXT,
            $columnUserName TEXT,
            $columnEmail TEXT,
            $columnProfileImage TEXT,
            $columnAddress TEXT,
            $columnPhone TEXT,
            $columnWebsite TEXT,
            $columnCompany TEXT
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(EmployeeModel employeeModel) async {
    Database db = await instance.database;
    return await db.insert(table, employeeModel.toJson());
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<EmployeeModel>> queryAllRows() async {
    Database db = await instance.database;
    var result = await db.query(table);
    List<EmployeeModel> employees =
        result.map((tagJson) => EmployeeModel.fromJson(tagJson)).toList();
    return employees;
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnName LIKE '%$name%'");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
