import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;
  const MyButtons({
    Key? key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: buttontapped,
        child: ClipRRect(
          child: Container(
            height: 30,
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
