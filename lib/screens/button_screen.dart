import 'package:flutter/material.dart';
import 'package:fortuna_bet/screens/web_screen.dart';
class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});
  static const String route = 'button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, WebScreen.route),
            style: ButtonStyle(
              minimumSize:  MaterialStateProperty.all(const Size(100,60)),
              elevation: MaterialStateProperty.all(5),
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              overlayColor: MaterialStateProperty.all(Colors.teal[800]),
              animationDuration: const Duration(milliseconds: 5000),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              shadowColor: MaterialStateProperty.all(Colors.teal[800]),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
              child: const Text('GO'),
          ),
        ),
      ),
    );
  }
}
