import 'package:flutter/material.dart';

class SensorDetailInfo extends StatelessWidget {
  const SensorDetailInfo({super.key});

  Widget _infoItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          _infoItem(
            icon: Icons.directions_run_rounded,
            title: 'Movement Score',
            description: 'Dihitung dari magnitude accelerometer pada sumbu X, Y, dan Z.',
            color: Colors.purpleAccent,
          ),
          _infoItem(
            icon: Icons.screen_rotation_alt_rounded,
            title: 'Rotation Score',
            description: 'Dihitung dari magnitude gyroscope untuk mendeteksi rotasi perangkat.',
            color: Colors.cyanAccent,
          ),
          _infoItem(
            icon: Icons.wb_sunny_rounded,
            title: 'Light Level',
            description: 'Dibaca dari ambient light sensor dalam satuan lux.',
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}