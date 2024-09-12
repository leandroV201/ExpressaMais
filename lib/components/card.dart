import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class IconNameCard extends StatelessWidget {
  final FlutterTts _tts = FlutterTts();
  final IconData icon;
  final String name;
  final String mensagem;

  _speak() async {
    await _tts.speak(mensagem);
  }

  IconNameCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.mensagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4.0, // elevação para sombra
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // bordas arredondadas
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40.0, // tamanho do ícone
            color: Colors.blue, // cor do ícone
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 18.0, // tamanho da fonte
              fontWeight: FontWeight.bold, // negrito
            ),
          ),
        ),
      ),
      onTap: (){_speak();},
    );
  }
}
