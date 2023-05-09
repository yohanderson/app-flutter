import 'package:flutter/material.dart';

void ViewSnackBar(String messege, BuildContext context) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:  Text(messege),
    duration: const Duration(milliseconds: 1200),
  ));
}