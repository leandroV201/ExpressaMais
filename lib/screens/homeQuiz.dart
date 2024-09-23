import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fundacaoama/screens/homeScreen.dart';
import 'package:fundacaoama/screens/quiz_screen.dart';

class HomeQuiz extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<HomeQuiz> {
  int _numberOfPlayers = 2;
  List<Color> _playerColors = [];

  @override
  void initState() {
    super.initState();
    _playerColors = List<Color>.filled(_numberOfPlayers, Colors.blue);
  }

  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          numberOfPlayers: _numberOfPlayers,
          playerColors: _playerColors,
        ),
      ),
    );
  }

  void _selectColor(int playerIndex) {
    showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = _playerColors[playerIndex];
        return AlertDialog(
          title: Text('Selecione a cor para o Jogador ${playerIndex + 1}'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _playerColors[playerIndex] = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pegar a largura e altura da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homescreen()));}, icon: Icon(Icons.arrow_back))
        ,title: Text('Jogo de Quiz'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(color: Color(0xFFececf4)),
              child: Text(
                'Quantas pessoas irão jogar',
                style: TextStyle(fontSize: screenWidth * 0.07),
                 // Responsivo
                textAlign: TextAlign.center,
                
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            DecoratedBox(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.01),
                child: DropdownButton<int>(
                  isExpanded: true,
                  underline: Container(),
                  style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.black),
                  value: _numberOfPlayers,
                  items: [2, 3, 4].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        _numberOfPlayers = value!;
                        _playerColors =
                            List<Color>.filled(_numberOfPlayers, Colors.blue);
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              height: screenHeight * 0.4, // Responsivo
              child: ListView.builder(
                itemCount: _numberOfPlayers,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _playerColors[index],
                      radius: screenWidth * 0.08, // Responsivo
                    ),
                    title: Text(
                      'Jogador ${index + 1}',
                      style: TextStyle(fontSize: screenWidth * 0.05), // Responsivo
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.color_lens,
                        size: screenWidth * 0.1, // Responsivo
                      ),
                      onPressed: () => _selectColor(index),
                    ),
                    contentPadding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  );
                },
              ),
            ),
            InkWell(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                width: screenWidth * 0.8, // Responsivo
                height: screenHeight * 0.1, // Responsivo
                child: Center(
                  child: Text(
                    "Começar jogo",
                    style: TextStyle(fontSize: screenWidth * 0.06), // Responsivo
                  ),
                ),
                margin: EdgeInsets.only(bottom: screenHeight * 0.05),
              ),
              onTap: _startGame,
            )
          ],
        ),
      ),
    );
  }
}
