import 'package:flutter/material.dart';

class QuickBox extends StatelessWidget {
  const QuickBox({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        width: 150,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 32, 6, 96),
              Color.fromARGB(255, 57, 119, 194),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text(
            style: const TextStyle(
              fontFamily: 'Akaya',
              fontSize: 20,
              color: Color.fromARGB(255, 235, 234, 243),
              fontWeight: FontWeight.bold,
            ),
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
