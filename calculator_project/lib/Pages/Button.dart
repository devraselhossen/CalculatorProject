import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final buttonText;
  final buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Card(
            color: color,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: color,
                borderRadius: BorderRadius.circular(15)
              ),

              child: Center(
                child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

