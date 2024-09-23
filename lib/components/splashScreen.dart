import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fundacaoama/screens/homeScreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay de 2 segundos
    Timer(Duration(seconds: 2), () {
      // Navegar para a próxima tela após 2 segundos
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.speaker,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            // Nome do App
            Text(
              "Jogo das falas",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
