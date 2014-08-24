library tekartik_version_utils;

import 'package:tekartik_utils/version.dart';
export 'package:tekartik_utils/version.dart';

/// Regex that matches a version number at the beginning of a string.
final _START_VERSION = new RegExp(r'^' // Start at beginning.
r'(\d+).((\d+))?' // Version number.
);
/// Like [_START_VERSION] but matches the entire string.
final _COMPLETE_VERSION = new RegExp("${_START_VERSION.pattern}\$");


// Handle String with 4 numbers
/// Regex that matches a version number at the beginning of a string.
final _FOUR_NUMBER_START_VERSION = new RegExp(r'^' // Start at beginning.
r'(\d+).(\d+).(\d+).([0-9A-Za-z-]*)') // Version number.
;

/// Like [_START_VERSION] but matches the entire string.
final _FOUR_NUMBER_COMPLETE_VERSION = new RegExp("${_FOUR_NUMBER_START_VERSION.pattern}\$");

/**
 * Add support for version X, X.X not supported in platform version
 */
Version parseVersion(String text) {
  try {
    return new Version.parse(text);
  } on FormatException catch (e, st) {
    Match match = _COMPLETE_VERSION.firstMatch(text);
    if (match != null) {

      try {
        //      print(match[0]);
        //      print(match[1]);
        //      print(match[2]);
        int major = int.parse(match[1]);
        int minor = int.parse(match[2]);

        return new Version(major, minor, 0);
      } on FormatException catch (ex) {
        throw e;

      }
    } else {
      match = _FOUR_NUMBER_COMPLETE_VERSION.firstMatch(text);
      if (match != null) {

        try {
          //      print(match[0]);
          //      print(match[1]);
          //      print(match[2]);
          int major = int.parse(match[1]);
          int minor = int.parse(match[2]);
          int patch = int.parse(match[3]);
          String build = match[4];

          return new Version(major, minor, patch, build: build);
        } on FormatException catch (ex) {
          throw e;

        }
      } else {
        throw new FormatException('Could not parse "$text".');
      }
    }


  }
}
