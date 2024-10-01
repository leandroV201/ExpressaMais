import 'package:flutter/material.dart';
import 'package:fundacaoama/components/image_cards.dart';


class Segundo extends StatefulWidget {
  const Segundo({super.key});

  @override
  State<Segundo> createState() => _SegundoState();
}

class _SegundoState extends State<Segundo> {
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
                ImageCard(path: 'assets/images/segundo/agua.png', mensagem: "sede"),
                ImageCard(path: 'assets/images/segundo/sleep.png', mensagem: "sono"),
                ImageCard(path: 'assets/images/segundo/comendo.png', mensagem: "fome"),
                ImageCard(path: 'assets/images/segundo/doente.png', mensagem: "doente"),
                ImageCard(path: 'assets/images/segundo/chuveiro.png', mensagem: "sujo"),
                ImageCard(path: 'assets/images/segundo/questao.png', mensagem: "ajuda"),
                ImageCard(path: 'assets/images/segundo/calor.png', mensagem: "quente"),
                ImageCard(path: 'assets/images/segundo/frio.png', mensagem: "frio"),
                ImageCard(path: 'assets/images/segundo/triste.png', mensagem: "triste"),
                ImageCard(path: 'assets/images/segundo/feliz.png', mensagem: "feliz"),
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
