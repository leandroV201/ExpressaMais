import 'package:flutter/material.dart';
import 'package:fundacaoama/components/buttons.dart';
import 'package:fundacaoama/screens/primeiro.dart';

class HomeFala extends StatefulWidget {
  @override
  State<HomeFala> createState() => _HomeFalaState();
}

class _HomeFalaState extends State<HomeFala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Inicio'),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: ButtonCard(
              icon: Icons.star
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Primeiro()));
            },
          ),
          InkWell(
            child: ButtonCard(
              icon2: Icons.star,
              icon3: Icons.star,
            ),
          ),
          InkWell(
            child: ButtonCard(
              icon: Icons.star,
              icon2: Icons.star,
              icon3: Icons.star,
            ),
          )
        ],
      ),
      
    );
  }
}

