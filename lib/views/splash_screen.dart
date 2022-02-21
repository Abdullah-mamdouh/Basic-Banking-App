

import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key ? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    //Provider.of<WallpaperHelper>(context,listen: false);
    Timer(
        Duration(
          seconds: 2,
        ),
            () => Navigator.pushReplacement(
            context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                )),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xff0F1729F5),
      child: Card(
        color: Color(0xff1F2630),
       // elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Abdullah Mamdouh Atwa',style: TextStyle(fontSize: 20,color: Color(0xffFFDF00))),
            SizedBox(height: 20,),
            Text('+201098939306',style: TextStyle(fontSize: 20,color: Color(0xffFFDF00)),),
          ],
        ),
      ),
    );
  }
}