import 'package:flutter/material.dart';
import 'package:fundacaoama/components/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testes de Cards"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              child: Column(
        children: [IconNameCard(
        icon: Icons.local_drink,
        name: 'Sede muita',
        mensagem: 'Mãe eu quero cachaça',
      ),
      IconNameCard(
        icon: Icons.bed,
        name: 'Sono Muito',
        mensagem: 'Mãe eu quero jogar no bicho',
      )],
      ))),
    );
  }
}
