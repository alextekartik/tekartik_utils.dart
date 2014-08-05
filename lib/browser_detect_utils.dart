library tekartik_browser_utils;

import 'dart:html';
import 'version.dart';
import 'version_utils.dart';

// Handle stuff like 'Trident/7.0, Chrome/29.0...'
bool _checkAndGetVersion(String name) {
  int index = _userAgent.indexOf(name);
  if (index >= 0) {
    String versionString = _userAgent.substring(index + name.length + 1);
    int endVersion = versionString.indexOf(' ');
    if (endVersion >= 0) {
      versionString = versionString.substring(0, endVersion);
    }
    endVersion = versionString.indexOf(';');
    if (endVersion >= 0) {
      versionString = versionString.substring(0, endVersion);
    }
    _browserVersion = parseVersion(versionString);
    return true;
  }
  return false;

}
Version _browserVersion;

Version get browserVersion => _browserVersion;

bool _isIe;
bool get isIe {
  if (_isIe == null) {
    _init();
    _isIe = _checkAndGetVersion('Trident');
  }
  return _isIe;
}

bool _isChrome;

bool get isChrome {
  if (_isChrome == null) {
    _init();
    // Can check vendor too...
    _isChrome = _checkAndGetVersion('Chrome');
  }
  return _isChrome;
}

bool _isFirefox;
bool get isFirefox {
  if (_isFirefox == null) {
    _init();
    _isFirefox = _checkAndGetVersion('Firefox');
  }
  return _isFirefox;
}

bool _isSafari;
bool get isSafari {
  if (_isSafari == null) {
    _init();
    _isSafari = !isChrome && _userAgent.contains('Safari');
    if (_isSafari) {
      _checkAndGetVersion('Version');
    }
  }
  return _isSafari;
}

// every browser can be mobile
bool get isMobile {
  return false;
}

String _userAgent;

_init() {
  if (_userAgent == null) {
    _userAgent = window.navigator.userAgent;
  }
}
// For testing only
browserDetectSetUserAgent(String userAgent) {
  _userAgent = userAgent;
  _isFirefox = null;
  _isChrome = null;
  _isSafari = null;
  _isIe = null;
}
