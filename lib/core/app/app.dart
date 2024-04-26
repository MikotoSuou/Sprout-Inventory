import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sprout_inventory/res/theme.dart';
import '../navigation/router.dart';

class SIApp extends StatelessWidget {
  const SIApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    locale: DevicePreview.locale(context),
    builder: DevicePreview.appBuilder,
    debugShowCheckedModeBanner: false,
    theme: applicationTheme,
    routerConfig: router,
  );
}