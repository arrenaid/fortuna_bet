import 'package:flutter/material.dart';
import 'package:fortuna_bet/screens/button_screen.dart';
import 'package:fortuna_bet/screens/web_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ButtonScreen.route,
        routes: {
          ButtonScreen.route: (context) => const ButtonScreen(),
          WebScreen.route: (context) => const WebScreen(),
        });
  }
}
