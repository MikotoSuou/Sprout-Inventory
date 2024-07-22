
import 'package:flutter/material.dart';
import 'package:sprout_inventory/res/theme.dart';
import '../navigation/router.dart';

class SIApp extends StatelessWidget {
  const SIApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: applicationTheme,
    routerConfig: router,
  );
}