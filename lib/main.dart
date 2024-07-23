import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/app/app.dart';
import 'package:sprout_inventory/core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.initialize;

  runApp(const SIApp());
}