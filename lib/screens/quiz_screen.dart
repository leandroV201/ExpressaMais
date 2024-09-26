import 'package:flutter/material.dart';
import 'dart:math';
import 'results_screen.dart';

class QuizScreen extends StatefulWidget {
  final int numberOfPlayers;
  final List<Color> playerColors;

  const QuizScreen({super.key, required this.numberOfPlayers, required this.playerColors});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _currentPlayerIndex = 0;
  List<int> _scores = [];
  final List<IconData> _questions = [
    Icons.bed,
    Icons.local_drink,
    Icons.cookie,
    Icons.shower,
    Icons.local_fire_department,
    Icons.health_and_safety,
    Icons.mood_bad,
    Icons.mood_sharp,
  ];
  final List<List<String>> _options = [
    ['Fome', 'Cansado', 'Preguiça', 'Triste'],
    ['Cansado', 'Calor', 'Sede', 'Acordado'],
    ['Feliz', 'Frio', 'Medo', 'Fome'],
    ['Triste', 'Preguiça', 'Calor', 'Sujo'],
    ['Calor', 'Frio', 'Medo', 'Fome'],
    ['Cansado', 'Doente', 'Entediado', 'Fome'],
    ['Fome', 'Triste', 'Medo', 'Saudável'],
    ['Feliz', 'Frio', 'Sede', 'Acordado'],
  ];
  final List<int> _correctAnswers = [1, 2, 3, 3, 0, 1, 1, 0]; // Índice das respostas corretas

  List<String> _currentShuffledOptions = [];
  int _currentShuffledCorrectAnswer = 0;

  @override
  void initState() {
    super.initState();
    _scores = List<int>.filled(widget.numberOfPlayers, 0);
    _shuffleOptions(); // Embaralha as opções no início
  }

  void _shuffleOptions() {
    List<String> options = List.from(_options[_currentQuestionIndex]); // Copia as opções originais
    int correctAnswerIndex = _correctAnswers[_currentQuestionIndex];

    // Cria pares de opções e se são corretas ou não
    List<MapEntry<String, bool>> optionPairs = options
        .asMap()
        .entries
        .map((entry) => MapEntry(entry.value, entry.key == correctAnswerIndex))
        .toList();

    // Embaralha as opções
    optionPairs.shuffle(Random());

    // Atualiza as opções embaralhadas e o índice da resposta correta
    _currentShuffledOptions = optionPairs.map((pair) => pair.key).toList();
    _currentShuffledCorrectAnswer = optionPairs.indexWhere((pair) => pair.value == true);
  }

  void _answerQuestion(int answerIndex) {
    setState(() {
      // Verifica se a resposta está correta
      if (answerIndex == _currentShuffledCorrectAnswer) {
        _scores[_currentPlayerIndex]++;
      } else {
        // Se a resposta estiver errada, os pontos do jogador são redefinidos para 0
        _scores[_currentPlayerIndex] = 0;
      }

      // Verifica se o jogador atingiu 5 pontos
      if (_scores[_currentPlayerIndex] >= 5) {
        _showResults();
      } else {
        // Passa para o próximo jogador
        _currentPlayerIndex = (_currentPlayerIndex + 1) % widget.numberOfPlayers;

        // Avança para a próxima pergunta quando todos os jogadores tiverem jogado
        if (_currentPlayerIndex == 0) {
          _currentQuestionIndex++;
        }

        // Embaralha as opções para a próxima rodada
        if (_currentQuestionIndex < _questions.length) {
          _shuffleOptions();
        } else {
          // Se não houver mais perguntas, o jogo continua desde o início
          _currentQuestionIndex = 0;
          _shuffleOptions();
        }
      }
    });
  }

  void _showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(scores: _scores),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pegar a largura e altura da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Game'),
        backgroundColor: widget.playerColors[_currentPlayerIndex],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Ajuste responsivo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Jogador ${_currentPlayerIndex + 1}, é a sua vez!',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Ajuste responsivo da fonte
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02), // Espaçamento responsivo
              Icon(
                _questions[_currentQuestionIndex],
                size: screenWidth * 0.2, // Tamanho do ícone responsivo
              ),
              SizedBox(height: screenHeight * 0.02),
              ..._currentShuffledOptions.asMap().entries.map((entry) {
                int idx = entry.key;
                String option = entry.value;
                return Container(
                  margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(idx),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.2),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                  ),
                );
              }),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Pontos dos Jogadores:',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsivo
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              // Exibe os pontos de todos os jogadores
              ..._scores.asMap().entries.map((entry) {
                int idx = entry.key;
                int score = entry.value;
                return Text(
                  'Jogador ${idx + 1}: $score pontos',
                  style: TextStyle(fontSize: screenWidth * 0.045), // Responsivo
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
  