import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';

import '../modal/student.dart';

class DBProvider {
  DBProvider._();
  static final  DBProvider db = DBProvider._();

  static late Database _database;

  String studentsTable = 'Students';
  String columnId = 'id';
  String columnName = 'name';

  Future<Database> get database async {
    if (this.database != null) {
      return database;
    } else {
      _database = await _initDB();
      return _database;
    }
  }

  _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Student.db';
    return await OpenDatabaseOptions(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE $studentsTable($columnId INTEGER PRIMARY KAY AUTOINCREMENT, $columnName TEXT)');
  }

  // READ
 Future<List<Student>> getStudents() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> studentMapList = await db.query(studentsTable);
    final List<Student> studentList = [];
    studentMapList.forEach((studentMap) {
      studentList.add(Student.fromMap(studentMap));
    });
    return studentList;
 }

 // INSERT
 Future<Student> insertStudent(Student student) async {
    Database db = await this.database;
    student.id = await db.insert(studentsTable, student.toMap());
    return student;
 }

 // UPDATE
 Future<int> updateStudent(Student student) async {
  Database db = await this.database;
  return await db.update(
      studentsTable,
      student.toMap(),
      where: '$columnId = ?',
      whereArgs: [student.id]
  );
 }

 // DELETE
  Future<int> deleteStudent(int id) async {
    Database db = await this.database;
    return await db.delete(
        studentsTable,
        where: '$columnId = ?',
        whereArgs: [id]
    );
  }

}