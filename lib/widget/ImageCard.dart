
import 'package:banking_app/model/user.dart';
import 'package:banking_app/views/user_details.dart';
import 'package:flutter/material.dart';
class ImageCard extends StatelessWidget {
  ImageCard({Key? key,required this.user,required this.widget }) : super(key: key);

  final User user;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Theme.of(context).cardColor),
      child: GestureDetector(
        onTap: () =>
          //print(imageDetail);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget
              )),

        child: Column(
          children: [
            Image.asset('images/user.png')  ,
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(15.0),
            //   child: FadeInImage.assetNetwork(
            //     imageScale: 0.5,
            //     image: 'images/user.png', placeholder: '',
            //   ),
            // ),
            Text('${user.name}',style: TextStyle(fontSize: 15),)
          ],
        ),

      ),
    );
  }
}