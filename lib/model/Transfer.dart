

import 'package:banking_app/model/user.dart';

class Transfer {

 final String user1;
 final String user2;
 final double money;
 final String time;

  Transfer( {required this.user1, required this.user2, required this.money,required this.time});

 Transfer.fromMap(Map<String, dynamic> res)
     :// id = res["id"],
       user1 = res["user1"],
       user2 = res["user2"],
       money = res["money"],
       time = res['time'];

 Map<String, Object?> toMap() {
   return {//'id':id,
     'user1': user1, 'user2': user2, 'money': money, 'time': time};
 }
}