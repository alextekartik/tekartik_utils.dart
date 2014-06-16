library log_utils_test;

import 'package:unittest/unittest.dart';
//import 'package:unittest/vm_config.dart';
import 'package:logging/logging.dart' as log;
import 'package:tekartik_utils/log_utils.dart';

main() {
  //useVMConfiguration();
  
  group('log', () {
    test('parse level', () {
      expect(parseLogLevel('info'), equals(log.Level.INFO));
      expect(parseLogLevel('fine'), equals(log.Level.FINE));
      expect(parseLogLevel('dummy'), equals(log.Level.OFF));
    });
    
    test('format timestamp', () {
      expect(formatTimestampMs(1), equals('00.001'));
      expect(formatTimestampMs(100), equals('00.100'));
      expect(formatTimestampMs(1234), equals('01.234'));
      expect(formatTimestampMs(12345), equals('12.345'));
      expect(formatTimestampMs(123456), equals('23.456'));
      expect(formatTimestampMs(1.6), equals('00.002'));
      expect(formatTimestampMs(999.9), equals('01.000'));
      expect(formatTimestampMs(123456.4), equals('23.456'));
    });
  });
 
 
}

