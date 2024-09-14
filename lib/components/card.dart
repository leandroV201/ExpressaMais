import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class IconCard extends StatelessWidget {
  final FlutterTts _tts = FlutterTts();
  final IconData icon;
  final String mensagem;
  _speak() async {
    await _tts.setLanguage("pt-BR");
    await _tts.speak(mensagem);
  }

  IconCard({Key? key, required this.icon, required this.mensagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;  
    return InkWell(
      child: Container(
      margin: EdgeInsets.only(left: screenWidth * 0.025 ),
      width: screenWidth * 0.45,
      height: screenHeight * 0.3, 
        child: Card(
          elevation: 4.0, // elevação para sombra
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // bordas arredondadas
          ),
          child: Center(child: Icon(
              icon,
              size: 100.0, // tamanho do ícone
            ),
          ),
        ),
      ),
      onTap: () {
        _speak();
      },
    );
  }
}
