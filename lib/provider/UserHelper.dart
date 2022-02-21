

import 'package:banking_app/model/user.dart';
import 'package:banking_app/service/database.dart';
import 'package:flutter/material.dart';

class UserHelper with ChangeNotifier{
  Future<List<User>> ? users;
  var dbHelper;
  var curruntUser ;

  getUsersFromDB() async {
     dbHelper = DatabaseHandler();
     users = dbHelper.retrieveUsers();
     notifyListeners();
  }

  updateUser(User user){
    dbHelper = DatabaseHandler();
    dbHelper.updateUser(user);
    notifyListeners();
  }

  saveCurruntUser(User user){
    curruntUser = user;
    notifyListeners();
  }
}