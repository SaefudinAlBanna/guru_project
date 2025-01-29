import 'package:flutter/material.dart';

showSnackBar(BuildContext konteks, String text) {
  return ScaffoldMessenger.of(konteks).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
