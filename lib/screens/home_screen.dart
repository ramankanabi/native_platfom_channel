import 'package:flutter/material.dart';
import 'package:native_platform_channel/services/battery_level.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int? batteryLevel;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  _getBatteryLevel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BatteryLevel.getBatteryLevel().then((percent) {
        setState(() {
          batteryLevel = percent;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Native Platform Channel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Battery Level:$batteryLevel"),
          ],
        ),
      ),
    );
  }
}
