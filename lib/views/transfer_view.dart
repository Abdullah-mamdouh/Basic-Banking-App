import 'package:banking_app/model/Transfer.dart';
import 'package:banking_app/model/user.dart';
import 'package:banking_app/provider/TransferHelper.dart';
import 'package:banking_app/provider/UserHelper.dart';
import 'package:banking_app/views/home_page.dart';
import 'package:banking_app/views/user_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransverView extends StatelessWidget {
  TransverView({Key? key, required this.user}) : super(key: key);
  final User user;
  TextEditingController moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2630),
      appBar: AppBar(
        backgroundColor: Color(0xff152742F2),
        centerTitle: true,
        title: Text('${user.name}'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding:EdgeInsets.only(top: 20),
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              //child: Image.asset("images/money1.PNG"),
              backgroundImage: AssetImage("images/money1.PNG"),
              backgroundColor: Colors.transparent,
            ),
            Padding(padding: EdgeInsets.all(20),
              child: TextField(

                controller: moneyController,
                style: TextStyle(color: Colors.green, fontSize: 20,),
                decoration: InputDecoration(
                  fillColor: Color(0xff29313C),filled: true,
                  //labelText: "Money",
                  hintText: "Money",hintStyle: TextStyle(color: Color(0xff7D7D7D)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Color(0xffFFDF00))),
                ),
              ),),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Color(0xffFFDF00)),
              margin: EdgeInsets.only(top: 10, right: 25, left: 25),
              child: MaterialButton(
                  onPressed: () {
                    double money = double.parse(moneyController.text);
                    User? curr_user =
                        Provider.of<UserHelper>(context, listen: false)
                            .curruntUser;
                    if (moneyController.text != null ||
                        curr_user!.balance >= money) {
                      _dialoge(context, curr_user! , user, money);
                      //print(curr_user.balance);
                    }
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(color: Color(0xff7D7D7D)),
                  )),
            ),
          ],
        ),
      ),
      ),
    );
  }
  _dialoge(BuildContext context,User currunt_customer, User customer , double money){
    return showCupertinoDialog(
        context: context,
        builder: (context) =>CupertinoAlertDialog(
      title: Text("Operation Transfering"),
      actions: [
        CupertinoDialogAction(
            onPressed: (){
          Navigator.pop(context);
        },
            child: Text("Back")),
        CupertinoDialogAction(
            onPressed: (){
              /// update data of transmitter's Customer
              Provider.of<UserHelper>(context, listen: false)
                  .updateUser(new User(
                  name: user.name,
                  balance: user.balance + money,
                  email: user.email));

              /// update data of reciever's Customer
              Provider.of<UserHelper>(context, listen: false)
                  .updateUser(new User(
                  name: currunt_customer.name,
                  balance: currunt_customer.balance - money,
                  email: currunt_customer.email));
              print(user.balance + money);

              /// insert operation of transfering in dB
              Provider.of<TransferHelper>(context, listen: false)
                  .insertTransfer(new Transfer(
                  user1: currunt_customer.name,
                  user2: user.name,
                  money: (double.parse(moneyController.text)),
                  time: TimeOfDay.now().toString()));

              /// go to Home_page
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
        },
            child: Text("Done")),
      ],
      content: Text("Transfer ${money} to ${customer}"),
    ),);
  }
}
