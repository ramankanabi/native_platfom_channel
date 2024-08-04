import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevel {
  static const methodChannel = MethodChannel(
    'flutter.battery/methods',
  );

  static Future<int?> getBatteryLevel() async {
    try {
      final batteryLevel = await methodChannel.invokeMethod<int>(
        'getBatteryLevel',
      );
      return batteryLevel;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
