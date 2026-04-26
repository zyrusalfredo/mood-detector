import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withOpacity(0.18),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ruleItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: Colors.greenAccent.withOpacity(0.9),
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.72),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F1020),
              Color(0xFF1B1D3A),
              Color(0xFF21133F),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'How MoodSense Works',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'MoodSense memperkirakan kondisi pengguna berdasarkan kombinasi data sensor perangkat.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 28),

                _sectionCard(
                  icon: Icons.directions_run_rounded,
                  title: 'Accelerometer',
                  description:
                      'Digunakan untuk membaca intensitas gerakan perangkat. Dari nilai X, Y, dan Z, aplikasi menghitung movement score.',
                  color: Colors.purpleAccent,
                ),

                _sectionCard(
                  icon: Icons.screen_rotation_alt_rounded,
                  title: 'Gyroscope',
                  description:
                      'Digunakan untuk membaca perubahan rotasi perangkat. Sensor ini membantu mendeteksi apakah perangkat sering diputar atau digoyang.',
                  color: Colors.cyanAccent,
                ),

                _sectionCard(
                  icon: Icons.wb_sunny_rounded,
                  title: 'Ambient Light Sensor',
                  description:
                      'Digunakan untuk membaca tingkat cahaya sekitar dalam satuan lux. Data ini membantu membedakan kondisi terang, redup, atau gelap.',
                  color: Colors.orangeAccent,
                ),

                const SizedBox(height: 18),

                const Text(
                  'Mood Detection Rules',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    children: [
                      _ruleItem(
                        'Calm: gerakan rendah dan cahaya cukup terang.',
                      ),
                      _ruleItem(
                        'Energetic: gerakan tinggi dan rotasi perangkat tinggi.',
                      ),
                      _ruleItem(
                        'Sleepy: gerakan rendah dan kondisi sekitar gelap.',
                      ),
                      _ruleItem(
                        'Focused: gerakan stabil dengan cahaya cukup baik.',
                      ),
                      _ruleItem(
                        'Neutral: tidak ada pola sensor yang dominan.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.orangeAccent.withOpacity(0.25),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_rounded,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Catatan: aplikasi ini tidak membaca emosi manusia secara akurat. MoodSense hanya membuat estimasi kondisi berdasarkan pola sensor perangkat.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 13,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}