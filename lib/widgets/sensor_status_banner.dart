import 'package:flutter/material.dart';

class SensorStatusBanner extends StatelessWidget {
  final bool isDetecting;
  final bool isLightSensorAvailable;

  const SensorStatusBanner({
    super.key,
    required this.isDetecting,
    required this.isLightSensorAvailable,
  });

  @override
  Widget build(BuildContext context) {
    String title;
    String description;
    IconData icon;
    Color color;

    if (!isDetecting) {
      title = 'Sensor Stopped';
      description = 'Tekan Start Detection untuk mulai membaca sensor.';
      icon = Icons.sensors_off_rounded;
      color = Colors.grey;
    } else if (!isLightSensorAvailable) {
      title = 'Light Sensor Fallback';
      description = 'Sensor cahaya tidak tersedia. Menggunakan nilai default.';
      icon = Icons.warning_amber_rounded;
      color = Colors.orangeAccent;
    } else {
      title = 'Sensors Active';
      description = 'Accelerometer, gyroscope, dan light sensor aktif.';
      icon = Icons.sensors_rounded;
      color = Colors.greenAccent;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: color.withOpacity(0.28),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.62),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}