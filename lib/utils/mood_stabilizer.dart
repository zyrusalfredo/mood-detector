import '../models/mood_result.dart';

class MoodStabilizer {
  MoodResult? _lastCandidateMood;
  MoodResult? _stableMood;

  int _sameMoodCounter = 0;

  final int requiredConsistency;

  MoodStabilizer({
    this.requiredConsistency = 4,
  });

  MoodResult stabilize(MoodResult newMood) {
    if (_lastCandidateMood == null ||
        _lastCandidateMood!.mood != newMood.mood) {
      _lastCandidateMood = newMood;
      _sameMoodCounter = 1;
    } else {
      _sameMoodCounter++;
    }

    if (_stableMood == null || _sameMoodCounter >= requiredConsistency) {
      _stableMood = newMood;
    }

    return _stableMood!;
  }

  void reset() {
    _lastCandidateMood = null;
    _stableMood = null;
    _sameMoodCounter = 0;
  }
}