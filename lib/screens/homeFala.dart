import 'package:flutter/material.dart';
import 'package:fundacaoama/components/buttons.dart';
import 'package:fundacaoama/screens/primeiro.dart';
import 'package:fundacaoama/screens/terceiro.dart';

class HomeFala extends StatefulWidget {
  const HomeFala({super.key});

  @override
  State<HomeFala> createState() => _HomeFalaState();
}

class _HomeFalaState extends State<HomeFala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela de Início',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: const ButtonCard(icon: Icons.star),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Primeiro()));
              },
            ),
            InkWell(
              child: ButtonCard(
                icon2: Icons.star,
                icon3: Icons.star,
              ),
            ),
            InkWell(
             
              child: const ButtonCard(
                icon: Icons.star,
                icon2: Icons.star,
                icon3: Icons.star,
              ), onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Terceiro()));
              },
            )
          ],
        ),
      ),
    );
  }
}
