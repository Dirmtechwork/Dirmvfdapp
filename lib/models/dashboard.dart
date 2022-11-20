import 'package:flutter/material.dart';

class Dashboard {
  final String id;
  final String title;
  final Color color;

  const Dashboard({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
