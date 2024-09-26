import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fundacaoama/screens/homeScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay de 2 segundos
    Timer(const Duration(seconds: 2), () {
      // Navegar para a próxima tela após 2 segundos
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffAC87C5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            
            SizedBox(height: 20),
            // Nome do App
            Text(
              "Expressa+",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Fredoka',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
