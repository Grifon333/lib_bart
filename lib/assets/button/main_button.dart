import 'package:flutter/material.dart';

class MainButton {
  Widget button1({
    required Function() onPressed,
    required Color color,
    required String title,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 11)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)))),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
