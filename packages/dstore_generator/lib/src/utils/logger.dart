import 'package:ansicolor/ansicolor.dart';

enum LogLevel { info, severe, shout, warning }

abstract class logger {
  static final redPen = AnsiPen()
    ..red(
      bold: true,
    );

  static void shout(Object? message, [Object? st]) {
    _print(message, LogLevel.shout);
  }

  static void error(Object? message, [Object? e, Object? st]) {
    _print(message, LogLevel.severe);
    _print(e.toString(), LogLevel.severe);
    print(st);
  }

  static void warning(Object? message) {
    _print(message, LogLevel.warning);
  }

  static void _print(Object? message, LogLevel level) {
    var start = '\x1b[90m';
    const end = '\x1b[0m';
    const white = '\x1b[37m';
    switch (level) {
      case LogLevel.info:
        start = '\x1b[37m';
        break;
      case LogLevel.severe:
        start = '\x1b[103m\x1b[31m';
        break;
      case LogLevel.shout:
        start = '\x1b[41m\x1b[93m';
        break;
      case LogLevel.warning:
        start = '\x1b[93m';
        break;
    }
    final m = '$white${DateTime.now()}:$end$start${level}: ${message}$end';
    print(m);
  }
}
