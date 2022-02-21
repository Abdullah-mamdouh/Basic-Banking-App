
import 'package:banking_app/views/transfering.dart';
import 'package:banking_app/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _widgetOptions = <Widget>[UserView(), TransferingView()];

  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;
  bool showSelectedLabels = true, showUnselectedLabels = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        //backgroundColor: Theme.of(context).bottomAppBarColor,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2, vertical: 20),
        snakeViewColor: Theme.of(context).highlightColor,
        selectedItemColor: snakeShape == SnakeShape.indicator ? Theme.of(context).cardColor : null,
        unselectedItemColor: Theme.of(context).cardColor.withOpacity(0.5),
       // showUnselectedLabels: showUnselectedLabels,
        //showSelectedLabels: showSelectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black87,), label: 'Home',),
          const BottomNavigationBarItem(icon: Icon(Icons.transfer_within_a_station_outlined,color: Colors.black87,), label: 'Transfer'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 12,),
        unselectedLabelStyle: const TextStyle(fontSize: 8),
      ),
      body: IndexedStack(
        index: _selectedItemPosition,
        children: _widgetOptions,
      ),
    );
  }
}