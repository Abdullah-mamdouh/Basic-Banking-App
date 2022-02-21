
import 'dart:math';

import 'package:banking_app/model/user.dart';
import 'package:banking_app/provider/TransferHelper.dart';
import 'package:banking_app/provider/UserHelper.dart';
import 'package:banking_app/service/database.dart';
import 'package:banking_app/views/user_details.dart';
import 'package:banking_app/widget/ImageCard.dart';
import 'package:banking_app/widget/allUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<User>> getUsersFromDB() async {
  var dbHelper = DatabaseHandler();
  Future<List<User>> users = dbHelper.retrieveUsers();
  return users;
}
class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<User> users= [];
  late DatabaseHandler _dB;
  WidgetsBinding ? w ;
  SharedPreferences? pref;
  _seen()async{
    w = await WidgetsFlutterBinding.ensureInitialized();
    pref = await SharedPreferences.getInstance();
    pref!.setBool('seen', true);
  }
  Future<int> addUsers() async{
    for(int i =1; i<=10;i++){
      users.add(
          User(name: 'User $i',email: 'User$i@gmail.com',balance: double.parse('${Random().nextInt(50000)}')),
      );
      //print(users[i].name.toString());
    }
    return await this._dB.insertUser(users);
  }

  // Future<int> addUsers() async {
  //   User firstUser = User(name: "peter", balance: 24.0, email: 'User1@gmail.com');
  //   User secondUser = User(name: "john", balance: 31.0, email: 'User2@gmail.com');
  //   List<User> listOfUsers = [firstUser, secondUser];
  //   return await this._dB.insertUser(listOfUsers);
  // }

  @override
  void initState() {
    super.initState();
    //_list();
    this._dB = DatabaseHandler();
    this._dB.initializeDB().whenComplete(() async {
      //if(!(pref!.getBool('seen'))){
        await this.addUsers();
       // pref!.setBool('seen', true);
    //  }
      //_seen();
    });
    Provider.of<UserHelper>(context, listen: false).getUsersFromDB();
    Provider.of<TransferHelper>(context,listen: false).getTransfersFromDB();
  }

  @override
  Widget build(BuildContext context) {
    //print(users);
    return Scaffold(
      //0xFF0F1729F5
      backgroundColor: Color(0xff1F2630),
      appBar: AppBar(
        backgroundColor: Color(0xff152742F2),
      centerTitle: true,
      title: Text('Customers'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
    ),
      body: Container(
        child: AllUsers(transfer: false,),
        /*FutureBuilder<List<User>>(
        future: _dB.retrieveUsers(),
        builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot) {
          //print(_dB.retrieveUsers.toString());
          print(snapshot.toString());
          if (snapshot.hasData) {

            return StaggeredGridView.countBuilder(
          primary: false,
          crossAxisCount: 2 ,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) => ImageCard(user: snapshot.data![index],
            onClick: () {
              Provider.of<UserHelper>(context, listen: false).saveCurruntUser(snapshot.data![index]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserDetails(user: snapshot.data![index],)
                  ));
            }
          ),

          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          );

           /*
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int>(1),
                  onDismissed: (DismissDirection direction) async {
                    //await this._dB.deleteUser(snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].balance.toString()),
                      )),
                );
              },
            );

            */
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
        */
      ),
    );
  }
}
