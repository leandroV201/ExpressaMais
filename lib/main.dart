import 'package:flutter/material.dart';
import 'package:fundacaoama/components/splashScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SplashScreen()
        ),
      ),
    );
  }
}
