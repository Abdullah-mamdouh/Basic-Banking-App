
import 'package:banking_app/model/user.dart';
import 'package:banking_app/provider/UserHelper.dart';
import 'package:banking_app/views/transfer_view.dart';
import 'package:banking_app/views/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'ImageCard.dart';
class AllUsers extends StatefulWidget {
  AllUsers({Key? key,required this.transfer}) : super(key: key);
  bool transfer;
  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {


  @override
  void initState() {
    super.initState();
    Provider.of<UserHelper>(context, listen: false).getUsersFromDB();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2630),

      body: FutureBuilder<List<User>>(
      future: Provider.of<UserHelper>(context).users,
      builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot) {
        //print(_dB.retrieveUsers.toString());
        print(snapshot.toString());
        if (snapshot.hasData) {

          return StaggeredGridView.countBuilder(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) => ImageCard(user: snapshot.data![index],
              widget:widget.transfer ? TransverView(user: snapshot.data![index],)
                  : UserDetails(user: snapshot.data![index],),
              // onClick: ()=>
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => TransverView(user: snapshot.data![index],),//UserDetails(user: snapshot.data![index],)
              //         )),
            ),
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    )
      ,);
  }
}
