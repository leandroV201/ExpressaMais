import 'package:flutter/material.dart';
import 'package:fundacaoama/components/image_cards.dart';


class Terceiro extends StatefulWidget {
  const Terceiro({super.key});

  @override
  State<Terceiro> createState() => _TerceiroState();
}

class _TerceiroState extends State<Terceiro> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const 
        Text(
          "Cards de Fala",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.04),
          padding: const EdgeInsets.all(
              10.0), // Adiciona um padding ao redor do Wrap
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10.0, // Espaçamento horizontal entre os widgets
              runSpacing: 10.0, // Espaçamento vertical entre os widgets
              children: [
                ImageCard(path: 'assets/images/agua.jpg', mensagem: "sede"),
                ImageCard(path: 'assets/images/dormindo.jpg', mensagem: "sono"),
                ImageCard(path: 'assets/images/comendo.jpg', mensagem: "fome"),
                ImageCard(path: 'assets/images/doente.jpg', mensagem: "doente"),
                ImageCard(path: 'assets/images/sujo.jpg', mensagem: "sujo"),
                ImageCard(path: 'assets/images/ajuda.jpg', mensagem: "ajuda"),
                ImageCard(path: 'assets/images/calor.jpg', mensagem: "quente"),
                ImageCard(path: 'assets/images/frio.jpeg', mensagem: "frio"),
                ImageCard(path: 'assets/images/triste.jpg', mensagem: "triste"),
                ImageCard(path: 'assets/images/feliz.jpg', mensagem: "feliz"),
              ]
                  .map((card) => SizedBox(
                        width: (screenWidth / 2) -
                            15, // Largura de cada card para caber 2 por linha
                        child: card,
                      ))
                  .toList(),
            ),
          )),
    );
  }
}
