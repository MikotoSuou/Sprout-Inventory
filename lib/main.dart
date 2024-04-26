import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/app/app.dart';
import 'package:sprout_inventory/core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.initialize;

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const SIApp(),
    ),
  );
}