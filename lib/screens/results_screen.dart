import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<int> scores;

  ResultsScreen({required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.popUntil(context, (route) => route.isFirst);},child: Icon(Icons.arrow_back)),
        title: Text('Results'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Final Scores', style: TextStyle(fontSize: 24)),
          ...scores.asMap().entries.map((entry) {
            int playerIndex = entry.key;
            int score = entry.value;
            return Text('Player ${playerIndex + 1}: $score points');
          }).toList(),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text('Play Again'),
          ),
        ],
      ),)
    );
  }
}
