  import 'package:flutter/material.dart';

void buildsnakbar(BuildContext context,  String message , Color? backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }