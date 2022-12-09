import 'package:flutter/material.dart';

class MainButton {
  Widget elevatedButton({
    required Function() onPressed,
    required Color color,
    required String title,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 11)),
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

  Widget textButton({
    required String title,
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1),
            fontSize: 36
          ),
        ),
      ),
    );
  }
}
