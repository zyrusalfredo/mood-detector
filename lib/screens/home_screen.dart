import 'dart:async';
import 'package:flutter/material.dart';
import '../models/mood_result.dart';
import '../services/sensor_service.dart';
import '../utils/mood_detector.dart';
import '../utils/mood_stabilizer.dart';
import '../widgets/mood_card.dart';
import '../widgets/sensor_stat_card.dart';
import '../widgets/mood_history_list.dart';
import '../widgets/sensor_status_banner.dart';
import 'about_screen.dart';
import '../widgets/empty_history_card.dart';
import '../widgets/sensor_detail_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SensorService _sensorService = SensorService();

  final MoodStabilizer _moodStabilizer = MoodStabilizer(
    requiredConsistency: 4,
  );

  StreamSubscription<SensorData>? _sensorSubscription;
  Timer? _historyTimer;

  bool isDetecting = false;
  bool isLightSensorAvailable = true;

  double movementScore = 0;
  double rotationScore = 0;
  double lightLevel = 100;

  MoodResult currentMood = MoodResult(
    mood: 'Neutral',
    description: 'Tekan tombol Start Detection untuk mulai membaca sensor.',
    icon: Icons.sentiment_neutral_rounded,
    color: Colors.grey,
    confidence: 0.60,
    time: DateTime.now(),
  );

  final List<MoodResult> moodHistory = [];

  void toggleDetection() {
    if (isDetecting) {
      stopDetection();
    } else {
      startDetection();
    }
  }

  void startDetection() {
    setState(() {
      isDetecting = true;
    });

    _sensorService.start();

    _sensorSubscription = _sensorService.sensorStream.listen((data) {
      final detectedMood = MoodDetector.detect(
        movementScore: data.movementScore,
        rotationScore: data.rotationScore,
        lightLevel: data.lightLevel,
      );

      setState(() {
        movementScore = data.movementScore;
        rotationScore = data.rotationScore;
        lightLevel = data.lightLevel;
        isLightSensorAvailable = data.isLightSensorAvailable;
        currentMood = _moodStabilizer.stabilize(detectedMood);
      });
    });

    _historyTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        moodHistory.insert(0, currentMood);

        if (moodHistory.length > 10) {
          moodHistory.removeLast();
        }
      });
    });
  }

  void stopDetection() {
    _sensorSubscription?.cancel();
    _historyTimer?.cancel();
    _sensorService.stop();
    _moodStabilizer.reset();

    setState(() {
      isDetecting = false;
      isLightSensorAvailable = true;
    });
  }

  @override
  void dispose() {
    _sensorSubscription?.cancel();
    _historyTimer?.cancel();
    _sensorService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  'MoodSense',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Detect your vibe from device sensors',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 28),

                MoodCard(
                  mood: currentMood,
                  isDetecting: isDetecting,
                ),

                const SizedBox(height: 16),

                SensorStatusBanner(
                  isDetecting: isDetecting,
                  isLightSensorAvailable: isLightSensorAvailable,
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: SensorStatCard(
                        title: 'Movement',
                        value: movementScore.toStringAsFixed(1),
                        unit: 'score',
                        icon: Icons.directions_run_rounded,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: SensorStatCard(
                        title: 'Rotation',
                        value: rotationScore.toStringAsFixed(1),
                        unit: 'score',
                        icon: Icons.screen_rotation_alt_rounded,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                SensorStatCard(
                  title: 'Light Level',
                  value: lightLevel.toStringAsFixed(0),
                  unit: 'lux',
                  icon: Icons.wb_sunny_rounded,
                  isWide: true,
                ),
                const SizedBox(height: 16),
                const SensorDetailInfo(),
                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: toggleDetection,
                    icon: Icon(
                      isDetecting
                          ? Icons.stop_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    label: Text(
                      isDetecting ? 'Stop Detection' : 'Start Detection',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDetecting
                          ? Colors.redAccent
                          : const Color(0xFF8B5CF6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
                  child: Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.psychology_alt_rounded,
                          color: Colors.cyanAccent,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How MoodSense Works',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Lihat cara aplikasi membaca sensor dan menentukan mood.',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AboutScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_rounded),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Recent Mood History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                moodHistory.isEmpty
                    ? const EmptyHistoryCard()
                    : MoodHistoryList(history: moodHistory),
              ],
            ),
          ),
        ),
      ),
    );
  }
}