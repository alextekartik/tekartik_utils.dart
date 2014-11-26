library tekartik_utils_log;

export 'package:logging/logging.dart';
export 'package:tekartik_core/log_utils.dart';

////// quick replacement for `print()` - use `info()` or `debug()`
//bool _quickLoggingSetup = false;
//
///**
// * To user when you want to make sure code is removed
// */
//@deprecated
//debugQuickLogging(Level level) {
//  setupQuickLogging(level);
//}
//
//setupQuickLogging([Level level]) {
//  if (!_quickLoggingSetup) {
//    hierarchicalLoggingEnabled = true;
//    PrintHandler handler = new PrintHandler();
//    Logger.root.onRecord.listen((LogRecord logRecord) {
//      handler.call(logRecord);
//      
//    });
//    _quickLoggingSetup = true;
//  }
//  if (level != null) {
//    Logger.root.level = level;
//    //log.info("QuickLoggingSetup");
//  }
//  
//}
//
//class PrintHandler {
//  void call(LogRecord logRecord) {
//    print("${logRecord.time} ${logRecord.loggerName} ${logRecord.level} ${logRecord.message}");
//  }
//}
//
//final List<Level> LOG_LEVELS = [Level.SHOUT, Level.SEVERE, Level.WARNING, Level.INFO, Level.CONFIG, Level.FINE, Level.FINER, Level.FINEST, Level.ALL];
//Level parseLogLevel(String levelText) {
//
//  if (levelText != null) {
//    levelText = levelText.toUpperCase();
//    for (Level level in LOG_LEVELS) {
//      if (level.name == levelText) {
//        //print('level: $level');
//        return level;
//      }
//    }
//  }
//  return Level.OFF;
//}
//
//Logger _log;
//Logger get log {
//  if (_log == null) {
//    _log = new Logger('Quick');
//  }
//  return _log;
//}
//
//String formatTimestampMs(num timestamp) {
//  int size = 6;
//  String txt;
//  
//  if (timestamp == null) {
//    return stringPrefilled('(null)', 6, ' ');  
//  } else {
//    int s = (timestamp ~/ 1000);
//    int ms = (timestamp - s * 1000).round();
//    if (ms == 1000) {
//      s += 1;
//      ms = 0;
//    }
//    return '${stringPrefilled("${s % 100}", 2, "0")}.${stringPrefilled("$ms", 3, "0")}';
//  }
//}

