

import 'package:banking_app/model/Transfer.dart';
import 'package:banking_app/service/database.dart';
import 'package:flutter/material.dart';

class TransferHelper with ChangeNotifier{

  Future<List<Transfer>> ? Transfers;
  var dbHelper;

  getTransfersFromDB() async {
    dbHelper = DatabaseHandler();
    Transfers = dbHelper.retrieveTransfers();
    notifyListeners();
  }

  insertTransfer(Transfer transfer){
    dbHelper = DatabaseHandler();
    dbHelper.insertTransfer(transfer);
    notifyListeners();
  }

}