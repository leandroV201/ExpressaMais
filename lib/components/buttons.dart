  import 'package:flutter/material.dart';

  class ButtonCard extends StatelessWidget {
    final IconData? icon;
    final IconData? icon2;
    final IconData? icon3;
    const ButtonCard(
        {super.key,
        this.icon,
        this.icon2,
        this.icon3});

    @override
    Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFA96FCA)),
            margin: EdgeInsets.only(bottom: screenHeight *0.04),
            width: screenWidth *0.9,
            height: screenHeight *0.25,
            child: Center(child:  Row(
               mainAxisSize: MainAxisSize.min,
              children: [
              Icon(
                icon2,
                size: 80,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              Icon(
                icon,
                size: 80,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              Icon(
                icon3,
                size: 80,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ]))
      );
    }
  }
