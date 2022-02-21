import 'package:banking_app/model/user.dart';
import 'package:banking_app/provider/UserHelper.dart';
import 'package:banking_app/widget/allUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  UserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2630),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff152742F2),
        //elevation: 5,
        toolbarHeight: 65,
         // Theme.of(context).cardColor.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                    text: '${user.name}',
                    style: TextStyle(
                        color: Colors
                            .white) // Theme.of(context).textTheme.headline1,
                    ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
      IconButton(
      padding: EdgeInsets.only(right: 60),
        icon: Image.asset('images/user.png'),
        onPressed: () {
        }),

        ],
        /*actions: [
          AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                    padding: EdgeInsets.only(right: 30),
                    icon: Image.asset('images/user.png'),
                    onPressed: () {
                    }),
              ),
              secondChild: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),

              ),
              crossFadeState:  CrossFadeState.showFirst ,
              duration: const Duration(milliseconds: 400))

        ],*/
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            margin: EdgeInsets.only(top: 65),
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xff29313C),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: Image.asset("images/user.png"),
                  //backgroundImage: AssetImage("images/user.png"),
                  backgroundColor: Colors.transparent,
                ),
                Text('${user.name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(
                  height: 20,
                ),
                Text('${user.email}',style: TextStyle(color: Color(0xff7D7D7D),fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(
                  height: 20,
                ),
                Text('Balance :  ${user.balance} \$',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Color(0xffFFDF00)),
            margin: EdgeInsets.only(top: 10, right: 25, left: 25),
            child: MaterialButton(
                onPressed: () {
                  Provider.of<UserHelper>(context, listen: false).saveCurruntUser(user);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllUsers(transfer: true,),
                      ));
                },
                child: Text(
                  'Transfer',
                  style: TextStyle(color: Color(0xff7D7D7D),fontSize: 18,fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
