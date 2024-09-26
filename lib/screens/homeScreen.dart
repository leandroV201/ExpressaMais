import 'package:flutter/material.dart';
import 'package:fundacaoama/screens/homeFala.dart';
import 'package:fundacaoama/screens/homeQuiz.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Expressa+',
                style: TextStyle(
                  fontSize: 32, // Tamanho da fonte aumentado
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Fredoka',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeFala()));
              },
              child: Container(
                width: screenWidth *0.5,
                height: screenHeight *0.15,
                margin: const EdgeInsets.only(top: 18.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
                  border: Border.all(
                    color: const Color.fromARGB(255, 29, 29, 29), // Cor da borda
                    width: 2.0, // Aumenta a grossura da borda
                  ),
                  borderRadius: 
                      BorderRadius.circular(20), // Bordas arredondadas
                ),
                child: const Center(
                    child: Text(
                  "Fala",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeQuiz()));
              },
              child: Container(
                width: screenWidth *0.5,
                height: screenHeight *0.15,
                margin: const EdgeInsets.only(top: 18.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
                  border: Border.all(
                    color: const Color.fromARGB(255, 29, 29, 29), // Cor da borda
                    width: 2.0, // Aumenta a grossura da borda
                  ),
                  borderRadius:
                      BorderRadius.circular(20), // Bordas arredondadas
                ),
                child: const Center(
                    child: Text(
                  "Quiz",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
