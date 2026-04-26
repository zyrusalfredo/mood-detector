import 'package:flutter/material.dart';
import '../models/mood_result.dart';

class MoodDetector {
  static MoodResult detect({
    required double movementScore,
    required double rotationScore,
    required double lightLevel,
  }) {
    final movementIntensity = (movementScore - 9.8).abs();

    if (movementIntensity < 1.2 && lightLevel > 100) {
      return MoodResult(
        mood: 'Calm',
        description: 'Gerakan rendah dengan cahaya cukup terang.',
        icon: Icons.self_improvement_rounded,
        color: Colors.greenAccent,
        confidence: 0.88,
        time: DateTime.now(),
      );
    }

    if (movementIntensity > 5 && rotationScore > 3) {
      return MoodResult(
        mood: 'Energetic',
        description: 'Gerakan dan rotasi tinggi terdeteksi.',
        icon: Icons.flash_on_rounded,
        color: Colors.orangeAccent,
        confidence: 0.91,
        time: DateTime.now(),
      );
    }

    if (movementIntensity < 1.2 && lightLevel < 30) {
      return MoodResult(
        mood: 'Sleepy',
        description: 'Minim gerakan dan kondisi sekitar gelap.',
        icon: Icons.nightlight_round,
        color: Colors.blueAccent,
        confidence: 0.86,
        time: DateTime.now(),
      );
    }

    if (movementIntensity >= 1.2 &&
        movementIntensity <= 5 &&
        lightLevel > 100) {
      return MoodResult(
        mood: 'Focused',
        description: 'Gerakan stabil dengan cahaya cukup baik.',
        icon: Icons.center_focus_strong_rounded,
        color: Colors.cyanAccent,
        confidence: 0.82,
        time: DateTime.now(),
      );
    }

    return MoodResult(
      mood: 'Neutral',
      description: 'Tidak ada pola sensor yang dominan.',
      icon: Icons.sentiment_neutral_rounded,
      color: Colors.grey,
      confidence: 0.60,
      time: DateTime.now(),
    );
  }
}