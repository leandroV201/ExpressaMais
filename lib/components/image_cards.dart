import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ImageCard extends StatelessWidget {
  final FlutterTts _tts = FlutterTts();
  final String path;
  final String mensagem;
  _speak() async {
    await _tts.setLanguage("pt-BR");
    await _tts.speak(mensagem);
  }

  ImageCard({super.key, required this.path, required this.mensagem});

  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;  
    return InkWell(
      child: Container(
      margin: EdgeInsets.only(left: screenWidth * 0.025 ),
      width: screenWidth * 0.3,
      height: screenHeight * 0.24, 
        child: Card(
          color: const Color(0xFFA96FCA),
          elevation: 4.0, // elevação para sombra
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),// bordas arredondadas
          ),
          child: Center(child: Image.asset(path, width: screenHeight *0.23, height: screenHeight *0.27,)
          ),
        ),
      ),
      onTap: () {
        _speak();
      },
    );
  }
}
