import 'package:banking_app/provider/TransferHelper.dart';
import 'package:banking_app/provider/UserHelper.dart';
import 'package:banking_app/views/home_page.dart';
import 'package:banking_app/views/splash_screen.dart';
import 'package:banking_app/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async  {
  // WidgetsBinding w = await WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.setBool('seen',false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => TransferHelper()),
        ChangeNotifierProvider(create: (_) => UserHelper()),
      ],
    );
  }
}

