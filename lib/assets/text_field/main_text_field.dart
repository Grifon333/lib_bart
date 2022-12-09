import 'package:flutter/material.dart';

class MainTextField {
  Widget tf1({
    required String hintText,
  }) {
    return TextField(
      style: const TextStyle(fontSize: 30),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(14),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
      ),
    );
  }
}
