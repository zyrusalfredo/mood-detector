import 'dart:async';
import 'dart:math';

import 'package:ambient_light/ambient_light.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorData {
  final double movementScore;
  final double rotationScore;
  final double lightLevel;
  final bool isLightSensorAvailable;

  SensorData({
    required this.movementScore,
    required this.rotationScore,
    required this.lightLevel,
    required this.isLightSensorAvailable,
  });
}

class SensorService {
  final StreamController<SensorData> _controller =
      StreamController<SensorData>.broadcast();

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;
  StreamSubscription<double>? _lightSubscription;

  double _movementScore = 0;
  double _rotationScore = 0;
  double _lightLevel = 100;

  bool _isLightSensorAvailable = true;

  Stream<SensorData> get sensorStream => _controller.stream;

  void start() {
    stop();

    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      _movementScore = _calculateMagnitude(event.x, event.y, event.z);
      _emitData();
    });

    _gyroscopeSubscription = gyroscopeEventStream().listen((event) {
      _rotationScore = _calculateMagnitude(event.x, event.y, event.z);
      _emitData();
    });

    _lightSubscription = AmbientLight().ambientLightStream.listen(
      (lux) {
        _isLightSensorAvailable = true;
        _lightLevel = lux;
        _emitData();
      },
      onError: (_) {
        _isLightSensorAvailable = false;
        _lightLevel = 100;
        _emitData();
      },
    );
  }

  void stop() {
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
    _lightSubscription?.cancel();

    _accelerometerSubscription = null;
    _gyroscopeSubscription = null;
    _lightSubscription = null;
  }

  double _calculateMagnitude(double x, double y, double z) {
    return sqrt(x * x + y * y + z * z);
  }

  void _emitData() {
    if (!_controller.isClosed) {
      _controller.add(
        SensorData(
          movementScore: _movementScore,
          rotationScore: _rotationScore,
          lightLevel: _lightLevel,
          isLightSensorAvailable: _isLightSensorAvailable,
        ),
      );
    }
  }

  void dispose() {
    stop();
    _controller.close();
  }
}