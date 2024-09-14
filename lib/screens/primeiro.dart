import 'package:flutter/material.dart';
import 'package:fundacaoama/components/card.dart';

class Primeiro extends StatefulWidget {
  const Primeiro({Key? key}) : super(key: key);

  @override
  State<Primeiro> createState() => _PrimeiroState();
}

class _PrimeiroState extends State<Primeiro> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const Text("Cards de Fala"),
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
                IconCard(
                  icon: Icons.local_drink,
                  mensagem: 'Estou com sede',
                ),
                IconCard(
                  icon: Icons.bed,
                  mensagem: 'Estou cansado',
                ),
                IconCard(
                  icon: Icons.cookie,
                  mensagem: 'Estou com fome',
                ),
                IconCard(
                  icon: Icons.health_and_safety,
                  mensagem: 'Estou me sentindo doente',
                ),
                IconCard(
                  icon: Icons.shower,
                  mensagem: 'Quero banhar',
                ),
                IconCard(
                  icon: Icons.help,
                  mensagem: 'Não entendi',
                ),
                IconCard(
                  icon: Icons.local_fire_department,
                  mensagem: 'Estou com calor',
                ),
                IconCard(
                  icon: Icons.mood_bad,
                  mensagem: 'Estou Triste',
                ),
              ]
                  .map((card) => Container(
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
