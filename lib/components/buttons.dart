  import 'package:flutter/material.dart';

  class ButtonCard extends StatelessWidget {
    final IconData? icon;
    final IconData? icon2;
    final IconData? icon3;
    ButtonCard(
        {Key? key,
        this.icon,
        this.icon2,
        this.icon3})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.grey),
            margin: EdgeInsets.only(left: screenWidth * 0.05, bottom: screenHeight *0.03),
            width: screenWidth * 0.9 ,
            height: screenHeight * 0.25,
            child: Center(child:  Row(
               mainAxisSize: MainAxisSize.min,
              children: [
              Icon(
                icon2,
                size: 80,
                color: Colors.yellow,
              ),
              Icon(
                icon,
                size: 80,
                color: Colors.yellow,
              ),
              Icon(
                icon3,
                size: 80,
                color: Colors.yellow,
              ),
            ]))
      );
    }
  }
