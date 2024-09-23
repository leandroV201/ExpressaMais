import 'package:flutter/material.dart';
import 'package:fundacaoama/screens/homeFala.dart';
import 'package:fundacaoama/screens/homeQuiz.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome do App'),
            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => HomeFala()));},
              child: Container(
                width: screenWidth * 0.35,
                height: screenHeight * 0.2,
                margin: EdgeInsets.only(top: 18.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(child: Text("Fala")),
              ),
            ),
            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => HomeQuiz()));},
              child: Container(
              width: screenWidth * 0.35,
              height: screenHeight * 0.2,
              margin: EdgeInsets.only(top: 18.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Center(child: Text("Quiz")),
            ),)
          ],
        ),
      ),
    );
  }
}
