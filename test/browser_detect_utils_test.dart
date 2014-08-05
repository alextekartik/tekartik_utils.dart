library string_enum_test;

import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/browser_detect_utils.dart';
import 'package:unittest/unittest.dart';
import 'package:tekartik_utils/version.dart';


void main() {
  group('browser_detect', () {

    _checkSingleBrowser() {
      if (isChrome) {
        expect(isIe || isFirefox || isSafari, isFalse);
      }
      if (isSafari) {
        expect(isIe || isFirefox || isChrome, isFalse);
      }
      if (isIe) {
        expect(isSafari || isFirefox || isChrome, isFalse);
      }
      if (isFirefox) {
        expect(isIe || isSafari || isChrome, isFalse);
      }
    }
    tearDown(() {
      // Cleanup any change
      browserDetectSetUserAgent(null);
    });

    test('single_browser', () {
      _checkSingleBrowser();
    });
    test('one_browser', () {
      // But there should be at least one browser
      // TODO support opera...
      expect(isIe || isSafari || isChrome || isFirefox, isTrue);
    });

    test('safari', () {
      browserDetectSetUserAgent('Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25');
      expect(isSafari, isTrue);
      expect(browserVersion, new Version(6, 0, 0));
      _checkSingleBrowser();
    });

    test('ie', () {
      browserDetectSetUserAgent('Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729; Tablet PC 2.0; MALNJS; rv:11.0) like Gecko');
      expect(isIe, isTrue);
      expect(browserVersion, new Version(7, 0, 0));
      _checkSingleBrowser();
    });

    test('firefox', () {
      browserDetectSetUserAgent('Mozilla/5.0 (Windows NT 6.3; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0');
      expect(isFirefox, isTrue);
      expect(browserVersion, new Version(29, 0, 0));
      _checkSingleBrowser();
    });

    test('chrome', () {
      browserDetectSetUserAgent('Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36');
      expect(isChrome, isTrue);
      expect(browserVersion, new Version(36, 0, 1985, build: '125'));
      _checkSingleBrowser();
    });
  });

}
