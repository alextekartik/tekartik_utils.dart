library tekartik_test_utils;

import 'package:unittest/unittest.dart' as unittest;
export 'package:unittest/unittest.dart' hide solo_test, solo_group, skip_test, skip_group;
export 'package:tekartik_core/dev_utils.dart';

@deprecated
solo_test(spec, dynamic body()) {
  unittest.solo_test(spec, body);
}

@deprecated
solo_group(spec, dynamic body()) {
  unittest.solo_group(spec, body);
}

@deprecated
tmp_solo_group(spec, dynamic body()) {
  unittest.solo_group(spec, body);
}

@deprecated
tmp_solo_test(spec, dynamic body()) {
  unittest.solo_test(spec, body);
}

@deprecated
skip_test(spec, dynamic body()) {
  unittest.skip_test(spec, body);
}

@deprecated
tmp_skip_test(spec, dynamic body()) {
  unittest.skip_test(spec, body);
}

@deprecated
skip_group(spec, dynamic body()) {
  unittest.skip_group(spec, body);
}

@deprecated
tmp_skip_group(spec, dynamic body()) {
  unittest.skip_group(spec, body);
}

// to really skip a test for good
tk_skip_test(spec, dynamic body()) {
  unittest.skip_test(spec, body);
}

// to really skip a group for good
tk_skip_group(spec, dynamic body()) {
  unittest.skip_group(spec, body);
}

//expectNot(actual, matcher, {String reason, unittest.FailureHandler failureHandler, bool verbose: false}) {
//  matcher = unittest.wrapMatcher(matcher);
//  bool doesNotMatch;
//  var matchState = {};
//  try {
//    doesNotMatch = !matcher.matches(actual, matchState);
//  } catch (e, trace) {
//    doesNotMatch = false;
//    if (reason == null) {
//      reason = '${(e is String) ? e : e.toString()} at $trace';
//    }
//  }
//  if (!doesNotMatch) {
//    if (reason == null) {
//      reason = '${actual} ${matcher}';
//    }
//    if (failureHandler == null) {
//      failureHandler = unittest.getOrCreateExpectFailureHandler();
//    }
//    failureHandler.failMatch(actual, matcher, reason, matchState, verbose);
//  }
//}
