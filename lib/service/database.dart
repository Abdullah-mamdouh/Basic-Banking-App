

import 'package:banking_app/model/Transfer.dart';
import 'package:banking_app/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'banck.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users("
              //"id INTEGER PRIMARY KEY AUTOINCREMENT,"
              " name TEXT NOT NULL,balance DOUBLE NOT NULL, email TEXT)",
        );
        await database.execute(
          "CREATE TABLE transfers("
          //"id INTEGER PRIMARY KEY AUTOINCREMENT,"
              " user1 TEXT NOT NULL,user2 TEXT NOT NULL,money DOUBLE NOT NULL,time TEXT)",
        );
      },
      version: 1,
    );
  }
  Future<int> insertTransfer(Transfer transfer) async {
    int result = 0;
    final Database db = await initializeDB();
      result = await db.insert('transfers', transfer.toMap());
    return result;
  }

  Future<List<Transfer>> retrieveTransfers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Transfers');
    List<Transfer> Transfers = [];
    if (queryResult.length > 0) {
      for (int i = 0; i < queryResult.length; i++) {
        Transfers.add(Transfer.fromMap(queryResult[i]));
        print("ttttttttttttttt");
      }
    }
    return Transfers;
    //return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert('users', user.toMap());
      print(user.balance);
    }
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    List<User> users = [];
    if (queryResult.length > 0) {
      for (int i = 0; i < queryResult.length; i++) {
        users.add(User.fromMap(queryResult[i]));
        print("ddddddddd");
      }
    }
    return users;
    //return queryResult.map((e) => User.fromMap(e)).toList();
  }

  updateUser(User user) async{
    final Database db = await initializeDB();
    return await db.update('users',
      user.toMap(),
      where: "email = ?",
      whereArgs: [user.email],);
  }
}
