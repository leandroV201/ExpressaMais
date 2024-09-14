import 'package:flutter/material.dart';
import 'package:fundacaoama/components/buttons.dart';
import 'package:fundacaoama/screens/primeiro.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Inicio'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: ButtonCard(
              icon: Icons.star,
              icon2: null,
              icon3: null,
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
