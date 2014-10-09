library tekartik_test_config;

import 'package:logging/logging.dart';
export 'dart:async';
import 'package:unittest/src/configuration.dart';
import 'package:unittest/unittest.dart';
//export 'package:tekartik_common/test_utils.dart';

// only for test - INFO - basic output, FINE - show test name before/after - FINEST - samething for console test also
const Level DEBUG_LEVEL = Level.FINE;

abstract class DebugConfiguration {

  void debugOnCreate(Configuration configuration) {
    configuration.timeout = new Duration(seconds: 10); // consider 30 sometimes
  }

  void debugOnTestStart(TestCase testCase) {
    if (DEBUG_LEVEL <= Level.FINE) {
      print(testCase.description + " - started");
    }
  }

  void debugOnTestResult(TestCase testCase) {
    if (DEBUG_LEVEL <= Level.FINE) {
      if (!testCase.message.isEmpty) {
        print(testCase.description + " - " + testCase.message);
      } else {
        if (DEBUG_LEVEL <= Level.FINE) {
          print(testCase.description + " - ok");
        }
      }
    }
  }
}