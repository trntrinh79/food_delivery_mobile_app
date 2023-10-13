import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/widget/splash_screen.dart';
import 'package:food_delivery_mobile_app/widget/welcomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}
