import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(
          vertical:10,
          horizontal: 40,
        ),
      ),
      child: Text(text,
          style: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            
          ),
          textAlign: TextAlign.center,
          ),
    );
  }
}
