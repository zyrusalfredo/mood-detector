import 'package:flutter/material.dart';

class MoodResult {
  final String mood;
  final String description;
  final IconData icon;
  final Color color;
  final double confidence;
  final DateTime time;

  MoodResult({
    required this.mood,
    required this.description,
    required this.icon,
    required this.color,
    required this.confidence,
    required this.time,
  });
}