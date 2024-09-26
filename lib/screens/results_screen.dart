import 'package:flutter/material.dart';
import 'package:fundacaoama/screens/homeQuiz.dart';

class ResultsScreen extends StatelessWidget {
  final List<int> scores;

  const ResultsScreen({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text(
            'Resultado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                    16.0), // Define a margem de todos os lados
                child: Text(
                  'Pontuação Final:',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...scores.asMap().entries.map((entry) {
                int playerIndex = entry.key;
                int score = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0), // Margem vertical
                  child: Text(
                    'Jogador ${playerIndex + 1}: $score pontos',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }),
              ElevatedButton(
                
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeQuiz()));
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
            ],
          ),
        ));
  }
}
