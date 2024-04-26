import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger get logger => Log.instance;

class Log extends Logger {
  Log._() : super(
    printer: PrettyPrinter(printTime: true),
    level: (kDebugMode) ? Level.trace : Level.info,
  );
  static final instance = Log._();
}